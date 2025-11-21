<?php

namespace App\Http\Controllers\Sale;

use App\Models\Sale\Sale;
use Illuminate\Http\Request;
use App\Models\Sale\SalePayment;
use App\Http\Controllers\Controller;

class SalePaymentController extends Controller
{

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // METODO DE PAGO method_payment
        // EL MONTO amount
        // EL ID DE LA VENTA sale_id
        // Forzar monto a 2 decimales y usar bcmath para operaciones exactas
        $amount = number_format((float)$request->amount, 2, '.', '');

        $sale_payment = SalePayment::create([
            "sale_id" => $request->sale_id,
            "method_payment" => $request->method_payment,
            "amount" => $amount,
        ]);

        $sale = Sale::findOrFail($request->sale_id);

        // use bcsub/bcadd to avoid floating point precision issues
        $new_debt = bcsub((string)$sale->debt, (string)$sale_payment->amount, 2);
        $new_paid_out = bcadd((string)$sale->paid_out, (string)$sale_payment->amount, 2);

        $sale->update([
            "debt" => $new_debt, // MONTO ADEUDADO
            "paid_out" => $new_paid_out, // MONTO PAGADO
        ]);
        date_default_timezone_set('America/Lima');
        $state_payment = $sale->state_payment;
        $date_pay_complete = $sale->date_pay_complete;
        if(bccomp((string)$sale->debt, '0', 2) == 0){
            $state_payment = 3;
            $date_pay_complete = now();
        }
        $sale->update([
            "state_payment" => $state_payment,
            "date_pay_complete" => $date_pay_complete
        ]);

        return response()->json([
            "payment" => [
                "id" => $sale_payment->id,
                "method_payment" =>  $sale_payment->method_payment,
                "amount" =>  number_format((float)$sale_payment->amount, 2, '.', ''),
            ],
            "payment_total" => number_format((float)$sale->paid_out, 2, '.', ''),
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
       // METODO DE PAGO method_payment
        // EL MONTO amount
        // EL ID DE LA VENTA sale_id
        $sale_payment = SalePayment::findOrFail($id);
        $amount_old = number_format((float)$sale_payment->amount, 2, '.', '');
        $amount_new = number_format((float)$request->amount, 2, '.', '');
        $sale = Sale::findOrFail($request->sale_id);

        // calcular nuevo paid_out usando bcmath
        $paid_out_minus_old = bcsub((string)$sale->paid_out, (string)$amount_old, 2);
        $new_paid_out = bcadd($paid_out_minus_old, (string)$amount_new, 2);

        // si el nuevo paid_out supera el total de la venta -> error
        if(bccomp($new_paid_out, (string)$sale->total, 2) == 1){
            return response()->json([
                "message" => 403,
                "message_text" => "NO PUEDES INGRESAR UN MONTO, PORQUE SUPERA AL TOTAL DE LA VENTA"
            ]);
        }

        $sale_payment->update([
            "method_payment" => $request->method_payment,
            "amount" => $amount_new,
        ]);

        $new_debt = bcsub((string)$sale->total, (string)$new_paid_out, 2);

        $sale->update([
            "paid_out" => $new_paid_out, // MONTO PAGADO
            "debt" => $new_debt, // MONTO ADEUDADO
        ]);
        date_default_timezone_set('America/Lima');
        $state_payment = $sale->state_payment;
        $date_pay_complete = $sale->date_pay_complete;
        if(bccomp((string)$sale->debt, '0', 2) == 0){
            $state_payment = 3;
            $date_pay_complete = now();
        }
        // AÑADIR
        if(bccomp((string)$sale->debt, '0', 2) == 1 && bccomp((string)$sale->paid_out, '0', 2) == 1){
            $state_payment = 2;
            $date_pay_complete = null;
        }
        // 
        $sale->update([
            "state_payment" => $state_payment,
            "date_pay_complete" => $date_pay_complete
        ]);

        return response()->json([
            "payment" => [
                "id" => $sale_payment->id,
                "method_payment" =>  $sale_payment->method_payment,
                "amount" =>  number_format((float)$sale_payment->amount, 2, '.', ''),
            ],
            "payment_total" => number_format((float)$sale->paid_out, 2, '.', ''),
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $sale_payment = SalePayment::findOrFail($id);
        $sale = $sale_payment->sale;
        $sale_payment->delete();
        $amount_del = number_format((float)$sale_payment->amount, 2, '.', '');

        $new_paid_out = bcsub((string)$sale->paid_out, (string)$amount_del, 2);
        $new_debt = bcsub((string)$sale->total, (string)$new_paid_out, 2);

        $sale->update([
            "paid_out" => $new_paid_out, // MONTO PAGADO
            "debt" => $new_debt, // MONTO ADEUDADO
        ]);
        date_default_timezone_set('America/Lima');
        $state_payment = 2;
        $date_pay_complete = null;
        if(bccomp((string)$sale->paid_out, '0', 2) == 0){
            $state_payment = 1;
        }
        if(bccomp((string)$sale->paid_out, (string)$sale->total, 2) == 0){
            $state_payment = 3;
            $date_pay_complete = now();
        }
        $sale->update([
            "state_payment" => $state_payment,
            "date_pay_complete" => $date_pay_complete
        ]);

        return response()->json([
            "payment" => [
                "id" => $sale_payment->id,
                "method_payment" =>  $sale_payment->method_payment,
                "amount" =>  number_format((float)$sale_payment->amount, 2, '.', ''),
            ],
            "payment_total" => number_format((float)$sale->paid_out, 2, '.', ''),
        ]);
    }
}
