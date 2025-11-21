<table>
    <thead>
        <tr>
            <th width="40">Producto</th>
            <th  width="25">SKU</th>
            <th  width="25">Precio - Cliente Final</th>
            <th  width="25">Precio - Cliente Empresa</th>
            <th  width="25">Categoria</th>
            <th  width="25">¿Es regalo?</th>
            <th  width="25">¿Descuento?</th>
            <th  width="25">Tipo de Impuesto</th>
            <th  width="25">Importe Iva</th>
            <th  width="25">Disponibilidad</th>
            <th  width="20">Estado</th>
            <th  width="30">Dias de garantia</th>
        </tr>
    </thead>
    <tbody>
        <?php $__currentLoopData = $list_products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $list_product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <tr>
                <td>
                    <?php echo e($list_product->title); ?>

                </td>
                <td>
                    <?php echo e($list_product->sku); ?>

                </td>
                <td>
                    <?php echo e($list_product->price_general); ?>

                </td>
                <td>
                    <?php echo e($list_product->price_company); ?>

                </td>
                <td>
                    <?php echo e($list_product->product_categorie->title); ?>

                </td>
                <td>
                    <?php echo e($list_product->is_gift == 1 ? 'NO' : 'SI'); ?>

                </td>
                <td>
                    <?php echo e($list_product->is_discount == 1 ? 'NO' : 'SI'); ?>

                    <br>
                    Descuento: <?php echo e($list_product->max_discount); ?> %
                </td>
                <td>
                    <?php
                        $tax_name = '';
                    ?>
                    <?php switch($list_product->tax_selected):
                        case (1): ?>
                            <?php echo e($tax_name = "Sujeto a Impuesto"); ?>

                            <?php break; ?>
                        <?php case (2): ?>
                            <?php echo e($tax_name = "Libre de Impuesto"); ?>

                            <?php break; ?>
                        <?php default: ?>
                            
                    <?php endswitch; ?>
                    <?php echo e($tax_name); ?>

                </td>
                <td>
                    <?php echo e($list_product->importe_iva); ?> %
                </td>
                <td>
                    <?php
                        $disponibilida_name = '';
                    ?>
                    <?php switch($list_product->disponibilidad):
                        case (1): ?>
                            <?php echo e($disponibilida_name = "Vender sin Stock"); ?>

                            <?php break; ?>
                        <?php case (2): ?>
                            <?php echo e($disponibilida_name = "No Vender sin Stock"); ?>

                            <?php break; ?>
                        <?php default: ?>
                            
                    <?php endswitch; ?>
                    <?php echo e($disponibilida_name); ?>

                </td>

                <?php if($list_product->state == 1): ?>
                    <td style="background: #b6c8ff">
                        ACTIVO
                    </td>
                    <?php endif; ?>
                <?php if($list_product->state == 2): ?>
                <td style="background: #f7a6a6;">
                    INACTIVO
                </td>
                <?php endif; ?>

                <td>
                    <?php echo e($list_product->warranty_day); ?> dias
                </td>
            </tr>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

    </tbody>
</table><?php /**PATH C:\Users\Solaris\Documents\Solaris\GestionInventarios\api\resources\views/product/product_download_excel.blade.php ENDPATH**/ ?>