<?php

namespace App\Http\Controllers\Sale;

use App\Models\Sale\Sale;
use Illuminate\Http\Request;
use App\Models\Sale\SaleDetail;
use App\Http\Controllers\Controller;
use App\Http\Resources\Sale\SaleDetailResource;

class SaleDetailController extends Controller
{
    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $product = $request->product;

        // Create sale detail as you were doing
        $sale_detail = SaleDetail::create([
            "sale_id" => $request->sale_id,
            "product_id" => $product["id"],
            "product_categorie_id" => $product["product_categorie_id"],
            "unit_id" => $request->unit_id,
            "warehouse_id" => $request->warehouse_id,
            "quantity" => (int)$request->quantity,
            "price_unit" => round((float)$request->price, 2),
            "discount" => round((float)$request->discount, 2),
            "subtotal" => round((float)$request->subtotal, 2),
            "igv" => round((float)$request->igv, 2),
            "total" => round((float)$request->total, 2),
            "quantity_pending" => (int)$request->quantity,
        ]);

        $sale = Sale::findOrFail($request->sale_id);

        // Calculations with casting + round
        $discount = round((float)$sale->discount + (($sale_detail->discount) * $sale_detail->quantity), 2);
        $igv = round((float)$sale->igv + (($sale_detail->igv) * $sale_detail->quantity), 2);
        $subtotal = round((float)$sale->subtotal + (($sale_detail->price_unit) * $sale_detail->quantity), 2);
        $total = round((float)$sale->total + (float)$sale_detail->total, 2);

        $debt = round((float)$sale->debt + (float)$sale_detail->total, 2);

        date_default_timezone_set('America/Lima');
        $state_payment = 1;
        $date_pay_complete = null;

        if (round($debt, 2) == 0) {
            $state_payment = 3;
            $date_pay_complete = now();
        } else if ((float)$sale->paid_out > 0) {
            $state_payment = 2;
            $date_pay_complete = null;
        }

        $state_entrega = 1;
        if ($sale->state_sale == 1) {
            $state_entrega = 2;
        }

        $sale->update([
            "discount" => $discount,
            "igv" => $igv,
            "subtotal" => round($subtotal, 2),
            "total" => round($total, 2),
            "debt" => $debt,
            "state_payment" => $state_payment,
            "date_pay_complete" => $date_pay_complete,
            "state_entrega" => $state_entrega,
        ]);

        return response()->json([
            "detail" => SaleDetailResource::make($sale_detail),
            "discount" => round($discount, 2),
            "igv" => round($igv, 2),
            "subtotal" => round($subtotal, 2),
            "total" => round($total, 2),
            "debt" => round($debt, 2),
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $sale_detail = SaleDetail::findOrFail($id);
        $sale = $sale_detail->sale;

        $paid_out = (float)$sale->paid_out;

        $discount_old = (float)$sale_detail->discount * (int)$sale_detail->quantity;
        $igv_old = (float)$sale_detail->igv * (int)$sale_detail->quantity;
        $subtotal_old = (float)$sale_detail->subtotal;
        $total_old = (float)$sale_detail->total;

        // Calculate per-unit subtotal and total detail
        $price_unit = (float)$request->price_unit;
        $discount_unit = (float)$request->discount;
        $igv_unit = (float)$request->igv;
        $quantity_new = (int)$request->quantity;

        $subtotal_detail = round(($price_unit - $discount_unit + $igv_unit), 2);
        $total_detail = round($subtotal_detail * $quantity_new, 2);

        if ($price_unit < $discount_unit) {
            return response()->json([
                "message" => 403,
                "message_text" => "NO PUEDES INGRESAR UN PRECIO QUE SEA MENOR AL DESCUENTO",
            ]);
        }

        // Validate that after edit, total doesn't become less than paid_out
        $calculated_sale_total = round(((float)$sale->total - (float)$total_old) + (float)$total_detail, 2);
        if ($calculated_sale_total < round($paid_out, 2)) {
            return response()->json([
                "message" => 403,
                "message_text" => "NO PUEDES EDITAR ESTE DETALLE PORQUE EL MONTO SERA MENOR DE LO CANCELADO",
            ]);
        }

        $quantity_attend = (int)$sale_detail->quantity - (int)$sale_detail->quantity_pending;
        if ($quantity_attend > $quantity_new) {
            return response()->json([
                "message" => 403,
                "message_text" => "NO PUEDES INGRESAR UNA CANTIDAD MENOR A LA ENTREGADA",
            ]);
        }

        $state_attention = 1;
        if ($quantity_new == $quantity_attend) {
            $state_attention = 3;
        } else if ($quantity_attend > 0) {
            $state_attention = 2;
        }

        $sale_detail->update([
            "unit_id" => $request->unit_id,
            "price_unit" => $price_unit,
            "quantity" => $quantity_new,
            "discount" => $discount_unit,
            "igv" => round($igv_unit, 2),
            "subtotal" => round($subtotal_detail, 2),
            "total" => round($total_detail, 2),
            "description" => $request->description,
            "state_attention" => $state_attention,
            "quantity_pending" => $quantity_new - $quantity_attend,
        ]);

        date_default_timezone_set('America/Lima');
        $state_payment = 1;
        $date_pay_complete = null;

        $new_sale_total = round(((float)$sale->total - (float)$total_old) + (float)$sale_detail->total, 2);
        if ($new_sale_total == round($paid_out, 2)) {
            $state_payment = 3;
            $date_pay_complete = now();
        } else if ($paid_out > 0) {
            $state_payment = 2;
            $date_pay_complete = null;
        }

        $state_entrega = 1;
        $sale_detail_attention_count = SaleDetail::where("sale_id", $sale->id)->where("state_attention", 3)->count();
        if ($sale->sale_details->count() == $sale_detail_attention_count) {
            $state_entrega = 3;
        } else if ($sale_detail_attention_count > 0) {
            $state_entrega = 2;
        }

        // Update sale with rounded values
        $sale->update([
            "discount" => round(((float)$sale->discount - $discount_old) + ((float)$sale_detail->discount * (int)$sale_detail->quantity), 2),
            "igv" => round(((float)$sale->igv - $igv_old) + ((float)$sale_detail->igv * (int)$sale_detail->quantity), 2),
            "subtotal" => round(((float)$sale->subtotal - (float)$subtotal_old) + (float)$sale_detail->subtotal, 2),
            "total" => round(((float)$sale->total - (float)$total_old) + (float)$sale_detail->total, 2),
            "debt" => round(((float)$sale->debt - (float)$total_old) + (float)$sale_detail->total, 2),
            "state_payment" => $state_payment,
            "date_pay_complete" => $date_pay_complete,
            "state_entrega" => $state_entrega,
        ]);

        return response()->json([
            "detail" => SaleDetailResource::make($sale_detail),
            "discount" => round($sale->discount, 2),
            "igv" => round($sale->igv, 2),
            "subtotal" => round($sale->subtotal, 2),
            "total" => round($sale->total, 2),
            "debt" => round($sale->debt, 2),
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $sale_detail = SaleDetail::findOrFail($id);
        $sale = $sale_detail->sale;

        if ($sale_detail->state_attention != 1) {
            return response()->json([
                "message" => 403,
                "message_text" => "NO PUEDES ELIMINAR UN DETALLADO QUE YA TENGA UNA ENTREGA PARCIAL O COMPLETA"
            ]);
        }

        $sale_detail->delete();

        date_default_timezone_set('America/Lima');
        $paid_out = (float)$sale->paid_out;
        $state_payment = 1;
        $date_pay_complete = null;

        if (round(((float)$sale->total - (float)$sale_detail->total), 2) == round($paid_out, 2)) {
            $state_payment = 3;
            $date_pay_complete = now();
        } else if ($paid_out > 0) {
            $state_payment = 2;
            $date_pay_complete = null;
        }

        $state_entrega = 1;
        $sale_detail_attention_count = SaleDetail::where("sale_id", $sale->id)->where("state_attention", 3)->count();
        $sale_detail_count = SaleDetail::where("sale_id", $sale->id)->count();
        if ($sale_detail_count == $sale_detail_attention_count) {
            $state_entrega = 3;
        } else if ($sale_detail_attention_count > 0) {
            $state_entrega = 2;
        }

        // FIX: use discount property and round values
        $sale->update([
            "discount" => round((float)$sale->discount - ((float)$sale_detail->discount * (int)$sale_detail->quantity), 2),
            "igv" => round((float)$sale->igv - ((float)$sale_detail->igv * (int)$sale_detail->quantity), 2),
            "subtotal" => round((float)$sale->subtotal - (float)$sale_detail->subtotal, 2),
            "total" => round((float)$sale->total - (float)$sale_detail->total, 2),
            "debt" => round((float)$sale->debt - (float)$sale_detail->total, 2),
            "state_payment" => $state_payment,
            "date_pay_complete" => $date_pay_complete,
            "state_entrega" => $state_entrega,
        ]);

        return response()->json([
            "message" => 200,
            "sale_detail_id" => $id,
            "discount" => round($sale->discount, 2),
            "igv" => round($sale->igv, 2),
            "subtotal" => round($sale->subtotal, 2),
            "total" => round($sale->total, 2),
            "debt" => round($sale->debt, 2),
        ]);
    }
}