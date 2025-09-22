<script setup>
import accountLogo from '@images/cards/accounting-logo.png'
import marketingExpense from '@images/cards/marketing-expense-logo.png'
import salesOverview from '@images/cards/sales-overview-logo.png'

const websiteAnalytics = [
  {
    name: 'Marketing Expense',
    slideImg: marketingExpense,
    data: [
      {
        number: '5k',
        text: 'Operating',
      },
      {
        number: '6k',
        text: 'COGF',
      },
      {
        number: '2k',
        text: 'Financial',
      },
      {
        number: '1k',
        text: 'Expenses',
      },
    ],
  },
  {
    name: 'Accounting',
    slideImg: accountLogo,
    data: [
      {
        number: '18',
        text: 'Billing',
      },
      {
        number: '28',
        text: 'Sales',
      },
      {
        number: '30',
        text: 'Leads',
      },
      {
        number: '80',
        text: 'Impression',
      },
    ],
  },
  {
    name: 'Sales Overview',
    slideImg: salesOverview,
    data: [
      {
        number: '68',
        text: 'Open',
      },
      {
        number: '52',
        text: 'Converted',
      },
      {
        number: '04',
        text: 'Lost',
      },
      {
        number: '12',
        text: 'Quotations',
      },
    ],
  },
]
const sucursales = ref([]);

const sucursales_reporte_sales = async() => {
  try {
      const resp = await $api("kpi/sucursales_reporte_sales",{
            method: 'POST',
            body:{},
            onResponseError({response}){
                console.log(response._data.error);
            }
        })
    console.log(resp);
    sucursales.value = resp.sucursales;
  } catch (error) {
    console.log(error);
  }
}
onMounted(() => {
  sucursales_reporte_sales()
})
</script>

<template>
  <VCard color="error">
    <VCarousel
      :continuous="false"
      :show-arrows="false"
      hide-delimiter-background
      delimiter-icon="ri-circle-fill"
      height="auto"
      class="carousel-delimiter-top-end dots-active-white"
      v-if="sucursales.length > 0"
    >
      <VCarouselItem
        v-for="item in sucursales"
        :key="item.name"
      >
        <VCardItem>
          <VCardTitle class="text-white">{{ item.name }}</VCardTitle>
          <VCardSubtitle class="text-white">
            Total S/. {{ item.sales_total_sucursal }}

            <div class="d-inline-block text-success font-weight-medium" v-if="item.variation_perncetage_sale_total >= 0">
              <div class="d-flex align-center">
                +{{item.variation_perncetage_sale_total}}%
                <VIcon
                  icon="ri-arrow-up-s-line"
                  size="20"
                />
              </div>
            </div>

            <div class="d-inline-block text-danger font-weight-medium" v-if="item.variation_perncetage_sale_total < 0">
              <div class="d-flex align-center">
                -{{item.variation_perncetage_sale_total}}%
                <VIcon
                  icon="ri-arrow-down-s-line"
                  size="20"
                />
              </div>
            </div>

          </VCardSubtitle>
        </VCardItem>

        <VCardText class="py-0">
          <div class="d-flex flex-column flex-sm-row gap-6 mb-3">
            <div class="text-center">
              <img
                width="86"
                height="102"
                :src="accountLogo"
                class="rounded"
              >
            </div>
            <div>
              <h6 class="text-h6 text-white mb-2">
                {{ item.name }}
              </h6>
              <div>
                <VRow no-gutters>
                  <VCol
                    cols="6"
                    class="text-no-wrap text-truncate text-xs d-flex align-center gap-x-3 pb-3"
                  >
                    <div
                      style="background-color: rgba(var(--v-theme-on-surface), var(--v-selected-opacity));"
                      class="rounded px-2 py-1 text-body-1 text-white font-weight-medium"
                    >
                      {{ item.n_sales }}
                    </div>
                    <div class="text-body-1 text-white text-truncate">
                      N° de Ventas
                    </div>
                  </VCol>

                  <VCol
                    cols="6"
                    class="text-no-wrap text-truncate text-xs d-flex align-center gap-x-3 pb-3"
                  >
                    <div
                      style="background-color: rgba(var(--v-theme-on-surface), var(--v-selected-opacity));"
                      class="rounded px-2 py-1 text-body-1 text-white font-weight-medium"
                    >
                    {{ item.n_cotizaciones }}
                    </div>
                    <div class="text-body-1 text-white text-truncate">
                      N° Cotizaciónes
                    </div>
                  </VCol>

                  <VCol
                    cols="6"
                    class="text-no-wrap text-truncate text-xs d-flex align-center gap-x-3 pb-3"
                  >
                    <div
                      style="background-color: rgba(var(--v-theme-on-surface), var(--v-selected-opacity));"
                      class="rounded px-2 py-1 text-body-1 text-white font-weight-medium"
                    >
                      S/. {{ item.amount_total_payment }}
                    </div>
                    <div class="text-body-1 text-white text-truncate">
                      Monto Pagado
                    </div>
                  </VCol>

                  <VCol
                    cols="6"
                    class="text-no-wrap text-truncate text-xs d-flex align-center gap-x-3 pb-3"
                  >
                    <div
                      style="background-color: rgba(var(--v-theme-on-surface), var(--v-selected-opacity));"
                      class="rounded px-2 py-1 text-body-1 text-white font-weight-medium"
                    >
                    S/. {{ item.amount_total_not_payment }}
                    </div>
                    <div class="text-body-1 text-white text-truncate">
                     Monto Adeudado
                    </div>
                  </VCol>
                </VRow>
              </div>
            </div>
          </div>
        </VCardText>
      </VCarouselItem>
    </VCarousel>
  </VCard>
</template>
