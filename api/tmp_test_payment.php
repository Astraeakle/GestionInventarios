<?php
require __DIR__ . '/vendor/autoload.php';
$app = require __DIR__ . '/bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

$sale = \App\Models\Sale\Sale::first();
if(!$sale){
    echo "No sale found\n";
    exit(0);
}

echo "sale total (raw): "; var_export($sale->getAttributes()['total']); echo "\n";
echo "sale total (casted): "; var_export($sale->total); echo "\n";
echo "sale paid_out (casted): "; var_export($sale->paid_out); echo "\n";

// Simulate adding a payment of 125.01
$amount = number_format(125.01, 2, '.', '');
$new_paid_out = bcadd((string)$sale->paid_out, (string)$amount, 2);
$new_debt = bcsub((string)$sale->debt, (string)$amount, 2);

echo "simulated amount: "; var_export($amount); echo "\n";
echo "simulated new_paid_out: "; var_export($new_paid_out); echo "\n";
echo "simulated new_debt: "; var_export($new_debt); echo "\n";

echo "json sample: "; echo json_encode(['payment_total' => $new_paid_out, 'debt' => $new_debt]) . "\n";
