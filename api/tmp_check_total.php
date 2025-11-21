<?php
require __DIR__ . '/vendor/autoload.php';
$app = require __DIR__ . '/bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();
$sale = \App\Models\Sale\Sale::first();
if(!$sale){
    echo "No hay ventas en la base de datos." . PHP_EOL;
    exit(0);
}
echo "total_raw: "; var_export($sale->getAttributes()['total']); echo PHP_EOL; // raw attribute from DB
echo "total_casted: "; var_export($sale->total); echo PHP_EOL; // after casts
echo "type_casted: " . gettype($sale->total) . PHP_EOL;
echo "json: " . json_encode(['total' => $sale->total]) . PHP_EOL;
