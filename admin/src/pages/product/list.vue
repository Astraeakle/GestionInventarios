<script setup>
    const router = useRouter();
    const isProductDeleteDialogVisible = ref(false);
    const isImportExcelProductDialogVisible = ref(false);
    const currentPage = ref(1);
    const totalPage = ref(0);

    const list_products = ref([]);
    const sucursales = ref([]);
    const warehouses = ref([]);
    const units = ref([]);
    const categories = ref([]);
    const searchQuery = ref(null);
    const product_categorie_id = ref(null);
    const warehouse_stock_id = ref(null);
    const unit_stock_id = ref(null);
    const sucursale_price_id = ref(null);
    const disponibilidad = ref(null);
    const is_gift = ref(null);
    const product_selected_delete = ref(null);

    const list = async() => {
        try {
            let data = {
                search:searchQuery.value,
                product_categorie_id: product_categorie_id.value,
                warehouse_id: warehouse_stock_id.value,
                unit_id: unit_stock_id.value,
                sucursale_id: sucursale_price_id.value,
                disponibilidad: disponibilidad.value,
                is_gift: is_gift.value,
            }
            const resp = await $api("products/index?page="+currentPage.value,{
                method:'POST',
                body: data,
                onResponseError({response}){
                    console.log(response._data.error);
                }
            })
            console.log(resp);
            list_products.value = resp.products.data;
            totalPage.value = resp.total_page;
        } catch (error) {
            console.log(error);
        }
    }

    watch(currentPage,(val) => {
        console.log(val);
        list();
    })

    const reset = () => {
        searchQuery.value = '';
        product_categorie_id.value = null;
        warehouse_stock_id.value = null;
        unit_stock_id.value = null;
        sucursale_price_id.value = null;
        disponibilidad.value = null;
        is_gift.value = null;
        currentPage.value = 1;
        list();
    }

    const config = async() => {
        try {
            const resp = await $api("products/config",{
                method:'GET',
                onResponseError({response}){
                    console.log(response._data.error);
                }
            })
            console.log(resp);
            sucursales.value = resp.sucursales;
            warehouses.value = resp.warehouses;
            units.value = resp.units;
            categories.value = resp.categories;
        } catch (error) {
            console.log(error);
        }
    }

    const downloadExcel = () => {
        let QUERY_PARAMS = "";
        if(searchQuery.value){
            QUERY_PARAMS += "&search="+searchQuery.value;
        }
        if(product_categorie_id.value){
            QUERY_PARAMS += "&product_categorie_id="+product_categorie_id.value;
        }
        if(warehouse_stock_id.value){
            QUERY_PARAMS += "&warehouse_id="+warehouse_stock_id.value;
        }
        if(unit_stock_id.value){
            QUERY_PARAMS += "&unit_id="+unit_stock_id.value;
        }
        if(sucursale_price_id.value){
            QUERY_PARAMS += "&sucursale_id="+sucursale_price_id.value;
        }
        if(is_gift.value){
            QUERY_PARAMS += "&is_gift="+is_gift.value;
        }
        if(disponibilidad.value){
            QUERY_PARAMS += "&disponibilidad="+disponibilidad.value;
        }
        window.open(import.meta.env.VITE_API_BASE_URL+'products-excel?z=1'+QUERY_PARAMS,'_blank');
    }

    const importProducts = () => {
        list();
    }

    const addDeleteProduct = (Product) => {
        console.log(Product);
        let backup = list_products.value;
        list_products.value = [];
        let INDEX = backup.findIndex((product) => product.id == Product.id);
        if(INDEX != -1){
            backup.splice(INDEX,1);
        }
        setTimeout(() => {
            list_products.value = backup;
        }, 50);
    }

    const editItem = (product) => {
        console.log(product);
        router.push({
            name: 'product-edit-id',
            params: {
                id: product.id
            }
        });
    }
    const deleteItem = (item) => {
        isProductDeleteDialogVisible.value = true;
        product_selected_delete.value = item;
    }

    const avatarText = value => {
        if (!value)
            return ''
        const nameArray = value.split(' ')
        
        return nameArray.map(word => word.charAt(0).toUpperCase()).join('')
    }

    onMounted(() => {
        list();
        config();
    })

    
    definePage({ meta: { permission: 'list_product', } });
</script>
<template>
    <div>
        <VCard title="🖥️ Productos">
            <VCardText>
                <VRow class="">
                    <VCol cols="10">
                        <VRow>
                            <VCol cols="3">
                                <VTextField
                                    placeholder="Search Product"
                                    density="compact"
                                    class="me-3"
                                    v-model="searchQuery"
                                    @keyup.enter="list"
                                />
                            </VCol>
                            <VCol cols="3">
                                <VSelect
                                    placeholder="Select"
                                    label="Categoria"
                                    :items="categories"
                                    item-title="name"
                                    item-value="id"
                                    v-model="product_categorie_id"
                                >
                                </VSelect>
                            </VCol>
                            <VCol cols="3">
                                <VSelect
                                    :items="warehouses"
                                    item-title="name"
                                    item-value="id"
                                    placeholder="Select"
                                    v-model="warehouse_stock_id"
                                    label="Almacenes"
                                />
                            </VCol>
                            <VCol cols="3">
                                <VSelect
                                :items="units"
                                item-title="name"
                                item-value="id"
                                placeholder="Select"
                                v-model="unit_stock_id"
                                label="Unidades"
                                />
                            </VCol>
                            <VCol cols="3">
                                <VSelect
                                    :items="sucursales"
                                    item-title="name"
                                    item-value="id"
                                    placeholder="Select"
                                    label="Sucursales"
                                    v-model="sucursale_price_id"
                                />
                            </VCol>
                            <VCol cols="3">
                                <VSelect
                                    placeholder="Select"
                                    label="Disponibilidad"
                                    :items="[
                                    {
                                        id: 1,
                                        title: 'Vender sin Stock'
                                    },
                                    {
                                        id: 2,
                                        title: 'No Vender sin Stock'
                                    }
                                    ]"
                                    item-title="title"
                                    item-value="id"
                                    v-model="disponibilidad"
                                >
                                </VSelect>
                            </VCol>
                            <VCol cols="2">
                                <VSelect
                                    placeholder="¿Regalo?"
                                    label="¿Regalo?"
                                    :items="[
                                    {
                                        id: 1,
                                        title: 'NO'
                                    },
                                    {
                                        id: 2,
                                        title: 'SI'
                                    }
                                    ]"
                                    item-title="title"
                                    item-value="id"
                                    v-model="is_gift"
                                >
                                </VSelect>
                            </VCol>
                            <VCol cols="4">
                                <VBtn
                                    color="info"
                                    class="mx-1"
                                    prepend-icon="ri-search-2-line"
                                    @click="list()"
                                >
                                    <VTooltip
                                        activator="parent"
                                        location="top"
                                    >
                                        Buscar
                                    </VTooltip>
                                </VBtn>
                                <VBtn
                                    color="secondary"
                                    class="mx-1"
                                    prepend-icon="ri-restart-line"
                                    @click="reset()"
                                >
                                    <VTooltip
                                        activator="parent"
                                        location="top"
                                    >
                                        Limpieza
                                    </VTooltip>
                                </VBtn>
                                <VBtn
                                    color="success"
                                    class="mx-1"
                                    prepend-icon="ri-file-excel-2-line"
                                    @click="downloadExcel()"
                                >
                                    <VTooltip
                                        activator="parent"
                                        location="top"
                                    >
                                        Exportar Productos
                                    </VTooltip>
                                </VBtn>
                                <VBtn
                                    color="success"
                                    class="mx-1"
                                    prepend-icon="ri-file-excel-line"
                                    @click="isImportExcelProductDialogVisible = !isImportExcelProductDialogVisible"
                                >
                                    <VTooltip
                                        activator="parent"
                                        location="top"
                                    >
                                        Importar Productos
                                    </VTooltip>
                                </VBtn>
                            </VCol>
                        </VRow>
                    </VCol>
                    <VCol cols="2" class="text-end">
                        <VBtn v-if="isPermission('register_product')" @click="router.push({name: 'product-add'})">
                            Add Product
                            <VIcon
                                end
                                icon="ri-add-line"
                            />
                        </VBtn>
                    </VCol>
                </VRow>
            </VCardText>
            
            <VTable>
               <thead>
                <tr>
                    <th class="text-uppercase">
                        Producto
                    </th>
                    <th class="text-uppercase">
                        SKU
                    </th>
                    <th class="text-uppercase">
                        Categoria
                    </th>
                    <th class="text-uppercase">
                        ¿Es un regalo?
                    </th>
                    <th class="text-uppercase">
                        ¿Tiene descuento?
                    </th>

                    <th class="text-uppercase">
                        Importe Iva
                    </th>
                    <th class="text-uppercase">
                        Dias de garantia
                    </th>
                    <th class="text-uppercase">
                        Estado
                    </th>
                    <th class="text-uppercase">
                        Fecha de registro
                    </th>
                    <th class="text-uppercase">
                        Action
                    </th>
                </tr>
               </thead>

              <tbody>
                <tr
                    v-for="item in list_products"
                    :key="item.id"
                >
                    <td>
                        <div class="d-flex align-center">
                            <VAvatar
                                size="32"
                                :color="item.imagen ? '' : 'primary'"
                                :class="item.imagen ? '' : 'v-avatar-light-bg primary--text'"
                                :variant="!item.imagen ? 'tonal' : undefined"
                            >
                            <VImg
                                v-if="item.imagen"
                                :src="item.imagen"
                            />
                            <span
                                v-else
                                class="text-sm"
                            >{{ avatarText(item.title) }}</span>
                            </VAvatar>
                            <div class="d-flex ms-3">
                                {{ item.title }}
                            </div>
                        </div>
                        <VChip color="primary" v-if="item.state_stock == 1">
                            DISPONIBLE
                        </VChip>
                        <VChip color="warning" v-if="item.state_stock == 2">
                            POR AGOTAR
                        </VChip>
                        <VChip color="error" v-if="item.state_stock == 3">
                            AGOTADO
                        </VChip>
                    </td>
                    <td>
                        {{ item.sku }}
                    </td>
                    <td>
                        {{ item.product_categorie.name }}
                    </td>
                    <td>
                        {{ item.is_gift == 1 ? 'NO' : 'SI' }}
                    </td>
                    <td>
                        {{ item.is_discount == 1 ? 'NO' : 'SI' }}
                        <br>
                        <span v-if="item.is_discount == 2" style="text-wrap-mode: nowrap;">Descuento: {{ item.max_discount }} %</span>
                    </td>
                    <td>
                        {{ item.importe_iva }}
                    </td>
                    <td>
                        {{ item.warranty_day }} dias
                    </td>
                    <td>
                        <VChip color="primary" v-if="item.state == 1">
                            Activo
                        </VChip>
                        <VChip color="error" v-if="item.state == 2">
                            Inactivo
                        </VChip>
                    </td>
                    <td>
                        {{ item.created_at }}
                    </td>
                    <td>
                        <div class="d-flex gap-1">
                            <IconBtn
                                size="small"
                                @click="editItem(item)"
                                v-if="isPermission('edit_product')"
                            >
                                <VIcon icon="ri-pencil-line" />
                            </IconBtn>
                            <IconBtn
                                size="small"
                                @click="deleteItem(item)"
                                v-if="isPermission('delete_product')"
                            >
                                <VIcon icon="ri-delete-bin-line" />
                            </IconBtn>
                        </div>
                    </td>
                </tr>
               </tbody>
            </VTable>
            <VPagination
                v-model="currentPage"
                :length="totalPage"
            />
        </VCard>
        <ImportExcelProduct v-model:isDialogVisible="isImportExcelProductDialogVisible" @importExcelProduct="importProducts()"></ImportExcelProduct>
        <ProductDeleteDialog v-if="product_selected_delete && isProductDeleteDialogVisible" v-model:isDialogVisible="isProductDeleteDialogVisible" :productSelected="product_selected_delete" @deleteProduct="addDeleteProduct"></ProductDeleteDialog>
    </div>
</template>