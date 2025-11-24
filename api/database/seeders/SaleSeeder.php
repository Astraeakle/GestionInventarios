<?php

namespace Database\Seeders;

use Carbon\Carbon;
use App\Models\Sale\Sale;
use App\Models\Product\Product;
use App\Models\Sale\SaleDetail;
use Illuminate\Database\Seeder;
use App\Models\Sale\SalePayment;
use App\Models\Product\ProductWarehouse;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class SaleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Sale::factory()->count(250)->create()->each(function($sale) {
            $faker = \Faker\Factory::create();

            $num_items = $faker->randomElement([1,2,3,4,5]);

            $sum_total_sale = 0;$igv_total = 0;$discount_total = 0;$sum_sub_total_sale = 0;
            for ($i=0; $i < $num_items; $i++) { 
                $quantity = $faker->randomElement([1,2,3,4,5,6,7,8,9,10]);
                $product = Product::inRandomOrder()->first();
                $discount = $this->getDiscount($product);
                $warehouse = ProductWarehouse::where("product_id",$product->id)->inRandomOrder()->first();

                $subtotal = $product->price_general - $discount + ($product->price_general*$product->importe_iva*0.01);
                $sale_detail = SaleDetail::create([
                    "sale_id" => $sale->id,
                    "product_id" => $product->id,
                    "product_categorie_id" => $product->product_categorie_id,
                    "quantity" => $quantity,
                    "price_unit" => $product->price_general,
                    "discount" => $discount,
                    "subtotal" => round($subtotal,2),
                    "total"  => round(($subtotal * $quantity),2),
                    "description" => $faker->text($maxNbChars = 30),
                    "unit_id" => $warehouse ? $warehouse->unit_id : NULL,
                    "warehouse_id" => $warehouse ? $warehouse->warehouse_id : NULL,
                    "igv" => $product->importe_iva > 0 ? round($product->price_general* $product->importe_iva*0.01,2) : 0 ,
                    "created_at" => $sale->created_at,
                    "updated_at" => $sale->updated_at,
                ]);
                $sum_total_sale      = round($sum_total_sale + $sale_detail->total, 2);
                $igv_total           = round($igv_total + $sale_detail->igv, 2);
                $discount_total      = round($discount_total + $sale_detail->discount, 2);
                $sum_sub_total_sale  = round($sum_sub_total_sale + ($sale_detail->price_unit * $sale_detail->quantity), 2);

            }

            $sale = Sale::findOrFail($sale->id);
            
            $state_complete = 1;//PENDIENTE

            $sale_payment = NULL;
            if($sale->state_sale == 1){
                $state_complete = $faker->randomElement([2,3]); // 2 es parcial y 3 completo
                if($state_complete == 2){
                    $sale_payment = SalePayment::create([
                        "sale_id" => $sale->id,
                        "method_payment" =>  $faker->randomElement(['EFECTIVO',
                                            'DEPOSITO',
                                            'TRANSFERENCIA',
                                            'YAPE',
                                            'PLIN']),
                        "amount" => $sum_total_sale*0.45,
                        "created_at" => $sale->created_at,
                        "updated_at" => $sale->updated_at,
                    ]);
                }else{
                    $sale_payment = SalePayment::create([
                        "sale_id" => $sale->id,
                        "method_payment" =>  $faker->randomElement(['EFECTIVO',
                                            'DEPOSITO',
                                            'TRANSFERENCIA',
                                            'YAPE',
                                            'PLIN']),
                        "amount" => round($sum_total_sale, 2),
                        "created_at" => $sale->created_at,
                        "updated_at" => $sale->updated_at,           
                    ]);
                }

            }

            $n_days_v = $faker->randomElement([2,3,4,5,14,15]);
            $debt = $sum_total_sale - ($sale_payment ? $sale_payment->amount : 0);
            $sale->update([
                "subtotal" => round($sum_sub_total_sale, 2),
                "total" => round($sum_total_sale, 2),
                "igv" => round($igv_total, 2),
                "debt" => round($debt, 2),
                "discount" => round($discount_total, 2),
                "paid_out" => round(($sale_payment ? $sale_payment->amount : 0), 2),
                "state_payment" => $state_complete,
                "date_validation" => $sale->state_sale == 1 ? $sale->created_at : NULL,
                "date_pay_complete" => $state_complete == 3 ? $sale->created_at : NULL,
            ]);
            
        });
        // php artisan db:seed --class=SaleSeeder
    }

    public function getDiscount($product){
        if($product->max_discount > 0){
            return ($product->price_general*$product->max_discount*0.01);
        }
        return 0;
    }
}
