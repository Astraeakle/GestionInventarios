<script setup>
import mobile2 from '@images/cards/apple-iPhone-13-pro.png'
import desktop1 from '@images/cards/apple-mac-mini.png'
import desktop3 from '@images/cards/dell-inspiron-3000.png'
import mobile4 from '@images/cards/google-pixel-6.png'
import desktop2 from '@images/cards/hp-envy-x360.png'
import console3 from '@images/cards/nintendo-switch.png'
import mobile3 from '@images/cards/oneplus-9-pro.png'
import mobile1 from '@images/cards/samsung-s22.png'
import console1 from '@images/cards/sony-play-station-5.png'
import catImg3 from '@images/cards/tabs-console.png'
import catImg2 from '@images/cards/tabs-desktop.png'
import catImg1 from '@images/cards/tabs-mobile.png'
import console2 from '@images/cards/xbox-series-x.png'

const currentTab = ref('')
// [
//   {
//     title: 'mobile',
//     img: {
//       src: catImg1,
//       width: 30,
//       height: 58,
//     },
//   },
//   {
//     title: 'desktop',
//     img: {
//       src: catImg2,
//       width: 52,
//       height: 42,
//     },
//   },
//   {
//     title: 'console',
//     img: {
//       src: catImg3,
//       width: 60,
//       height: 42,
//     },
//   },
// ]
const categories = ref([]);
const products = ref([]);

const productData = {
  mobile: [
    {
      status: 'Out of Stock',
      revenue: '12.5k',
      conversion: 24,
      product: 'Samsung s22',
      image: mobile1,
    },
    {
      status: 'In Stock',
      revenue: '45k',
      conversion: -18,
      product: 'Apple iPhone 13 Pro',
      image: mobile2,
    },
    {
      status: 'Comming Soon',
      revenue: '98.2k',
      conversion: 55,
      product: 'Oneplus 9 Pro',
      image: mobile3,
    },
    {
      status: 'In Stock',
      revenue: '210k',
      conversion: 8,
      product: 'Google Pixel 6',
      image: mobile4,
    },
  ],
  desktop: [
    {
      status: 'In Stock',
      revenue: '94.6k',
      conversion: 16,
      product: 'Apple Mac Mini',
      image: desktop1,
    },
    {
      status: 'Comming Soon',
      revenue: '76.5k',
      conversion: 27,
      product: 'Newest HP Envy x360',
      image: desktop2,
    },
    {
      status: 'Out of Stock',
      revenue: '69.3k',
      conversion: -9,
      product: 'Dell Inspiron 3000',
      image: desktop3,
    },
  ],
  console: [
    {
      status: 'Comming Soon',
      revenue: '18.6k',
      conversion: 34,
      product: 'Sony Play Station 5',
      image: console1,
    },
    {
      status: 'Out of Stock',
      revenue: '29.7k',
      conversion: -21,
      product: 'XBOX Series X',
      image: console2,
    },
    {
      status: 'In Stock',
      revenue: '10.4k',
      conversion: 38,
      product: 'Nintendo Switch',
      image: console3,
    },
  ],
}

const resolveChipColor = status => {
  if (status === 1)
    return 'success'
  if (status === 2)
    return 'primary'
  if (status === 3)
    return 'warning'
}

const moreList = [
  {
    title: 'Last 28 Days',
    value: 'Last 28 Days',
  },
  {
    title: 'Last Month',
    value: 'Last Month',
  },
  {
    title: 'Last Year',
    value: 'Last Year',
  },
]

const month_list = ref([
        {
            id: '01',
            name: 'Enero',
        },
        {
            id: '02',
            name: 'Febrero',
        },
        {
            id: '03',
            name: 'Marzo'
        },
        {
            id: '04',
            name: 'Abril',
        },
        {
            id: '05',
            name: 'Mayo',
        },
        {
            id: '06',
            name: 'Junio'
        },
        {
            id: '07',
            name: 'Julio',
        },
        {
            id: '08',
            name: 'Agosto',
        },
        {
            id: '09',
            name: 'Septiembre'
        },
        {
            id: '10',
            name: 'Octubre',
        },
        {
            id: '11',
            name: 'Noviembre',
        },
        {
            id: '12',
            name: 'Diciembre'
        }
]);

const year_list = ref(['2023','2024','2025','2026','2027','2028']);

const month_selected = ref(((new Date().getMonth() + 1) <= 9 ? "0"+(new Date().getMonth() + 1) : (new Date().getMonth() + 1) + ''));
const year_selected = ref(new Date().getFullYear()+"");

const categories_most_sales = async() => {
  try {
    const resp = await $api("kpi/categories_most_sales",{
        method: 'POST',
        body:{
          year: year_selected.value,
          month: month_selected.value,
        },
        onResponseError({response}){
            console.log(response._data.error);
        }
    })
    console.log(resp);
    categories.value = resp.categories_products;
    currentTab.value = categories.value.length > 0 ? categories.value[0].name : '';
    products.value = categories.value.length > 0 ? categories.value[0].products : '';
  } catch (error) {
    console.log(error);
  }
}
const categorieSelected = (category) => {
  products.value = category.products;
  currentTab.value = category.name;
}

watch(month_selected,() => {
  categories_most_sales();
})
watch(year_selected,() => {
  categories_most_sales();
})
onMounted(() => {
  categories_most_sales()
})
</script>

<template>
  <VCard
    title="Categories most sales"
    subtitle="Number of Sales"
  >
    <template #append>
      <VRow style="width: 350px;">
        <VCol cols="6">
          <VSelect
            :items="year_list"
            placeholder="Select"
            v-model="year_selected"
            label="Año"
          />
        </VCol>
        <VCol cols="6">
          <VSelect
            :items="month_list"
            item-value="id"
            item-title="name"
            placeholder="Select"
            v-model="month_selected"
            label="Mes"
          />
        </VCol>
      </VRow>
      <!-- <div class="me-n3 mt-n8">
        <MoreBtn :menu-list="moreList" />
      </div> -->
    </template>

    <VCardText class="pb-6">
      <VSlideGroup
        v-model="currentTab"
        show-arrows
        mandatory
      >
        <VSlideGroupItem
          v-for="category in categories"
          :key="category.name"
          v-slot="{ isSelected, toggle }"
          :value="category.name"
        >
          <div
            :class="isSelected ? 'selected-category' : 'not-selected-category'"
            class="d-flex flex-column justify-center align-center cursor-pointer rounded-xl px-5 py-2 me-4"
            style="block-size: 5.375rem;inline-size: 5.75rem;"
            @click="categorieSelected(category)"
          >
            <VImg
              v-bind="{
                src: category.imagen,
                width: 58,
                height: 58,
              }"
              alt="slide-img"
            />
          </div>
        </VSlideGroupItem>

        <!-- <VSlideGroupItem>
          <div
            class="d-flex flex-column justify-center align-center rounded-xl me-4 cursor-pointer not-selected-category"
            style="block-size: 5.375rem;inline-size: 5.75rem;"
          >
            <VAvatar
              rounded
              size="30"
              color="default"
              variant="tonal"
            >
              <VIcon
                icon="ri-add-line"
                size="22"
              />
            </VAvatar>
          </div>
        </VSlideGroupItem> -->
      </VSlideGroup>
    </VCardText>

    <VTable class="text-no-wrap text-sm referral-table">
      <thead>
        <tr>
          <th scope="col">
            IMAGE
          </th>
          <th scope="col">
            NAME
          </th>
          <th
            scope="col"
            class="text-end"
          >
            STATUS
          </th>
          <th
            scope="col"
            class="text-end"
          >
            TOTAL SALES
          </th>
          <th
            scope="col"
            class="text-end"
          >
            N° SALES
          </th>
        </tr>
      </thead>

      <tbody>
        <tr
          v-for="product in products"
          :key="product.product_id"
        >
          <td>
            <VAvatar
              rounded
              :image="product.product_imagen"
              size="34"
            />
          </td>

          <td style="text-wrap: initial;">
            {{ product.product_title }}
          </td>

          <td class="text-end">
            <VChip color="primary" v-if="product.product_state_stock == 1">
                DISPONIBLE
            </VChip>
            <VChip color="warning" v-if="product.product_state_stock == 2">
                POR AGOTAR
            </VChip>
            <VChip color="error" v-if="product.product_state_stock == 3">
                AGOTADO
            </VChip>
          </td>

          <td class="text-end font-weight-medium">
            S/. {{ product.total_sales }}
          </td>

          <td class="font-weight-medium text-end">
            {{ product.count_sales }}
          </td>
        </tr>
      </tbody>
    </VTable>
  </VCard>
</template>

<style lang="scss" scoped>
.selected-category {
  border: 2px solid rgb(var(--v-theme-primary));
}

.not-selected-category {
  border: 2px dashed rgba(var(--v-border-color), var(--v-border-opacity));
}
</style>

<style lang="scss">
.referral-table {
  &.v-table .v-table__wrapper table thead tr th {
    background: none !important;
    block-size: 3.5rem;
    border-block: thin solid rgba(var(--v-border-color), var(--v-border-opacity)) !important;
  }
}
</style>
