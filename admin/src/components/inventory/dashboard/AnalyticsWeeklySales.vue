<script setup>
import { useTheme } from 'vuetify'
import { hexToRgb } from '@layouts/utils'

const moreList = [
  {
    title: 'Refresh',
    value: 'refresh',
  },
  {
    title: 'Update',
    value: 'update',
  },
  {
    title: 'Share',
    value: 'share',
  },
]
const year_list = ref(['2024','2025','2026','2027','2028','2029']);
const year_selected = ref(new Date().getFullYear()+"");
const vuetifyTheme = useTheme()

const sales_for_month_year = async() => {
  try {
    
    const resp = await $api("kpi/sales_x_month_of_year",{
        method: 'POST',
        body:{
          year: year_selected.value,
        },
        onResponseError({response}){
            console.log(response._data.error);
        }
    })
    console.log(resp);
    let categories_labels = [];
    let sales_of_month_year_current = [];
    let sales_of_month_year_before = [];
    resp.sale_x_month_of_year_current.forEach(element => {
      categories_labels.push(element.created_at_format);
      sales_of_month_year_current.push(Number(element.total_sales));
    });
    resp.sale_x_month_of_year_before.forEach(element => {
      sales_of_month_year_before.push(Number(element.total_sales));
    });
    const themeColors = vuetifyTheme.current.value.colors
    const variableTheme = vuetifyTheme.current.value.variables
    const disabledText = `rgba(${ hexToRgb(String(themeColors['on-background'])) },${ variableTheme['disabled-opacity'] })`
    
    chartConfig.value = {
      chart: {
        stacked: true,
        parentHeightOffset: 0,
        toolbar: { show: false },
      },
      tooltip: { enabled: false },
      markers: {
        size: 4,
        strokeWidth: 3,
        fillOpacity: 1,
        strokeOpacity: 1,
        colors: 'rgba(var(--v-theme-surface), 1)',
        strokeColors: themeColors.warning,
      },
      stroke: {
        curve: 'smooth',
        width: [
          0,
          0,
          3,
        ],
        colors: [themeColors.warning],
      },
      colors: [
        `rgba(${ hexToRgb(String(themeColors.primary)) }, 1)`,
        `rgba(${ hexToRgb(String(themeColors.primary)) }, 0.12)`,
      ],
      dataLabels: { enabled: false },
      states: {
        hover: { filter: { type: 'none' } },
        active: { filter: { type: 'none' } },
      },
      legend: { show: false },
      grid: {
        yaxis: { lines: { show: false } },
        padding: {
          top: -28,
          left: -6,
          right: -8,
          bottom: -5,
        },
      },
      plotOptions: {
        bar: {
          borderRadius: 8,
          columnWidth: '57%',
          endingShape: 'flat',
          borderRadiusApplication: 'start',
          borderRadiusWhenStacked: 'all',
        },
      },
      xaxis: {
        axisTicks: { show: false },
        axisBorder: { show: false },
        categories: categories_labels,
        labels: {
          style: {
            fontSize: '13px',
            colors: disabledText,
            letterSpacing: '0.4px',
          },
        },
      },
      yaxis: {
        // max: 100,
        // min: -100,
        show: false,
      },
    }
    series.value = [
      {
        type: 'column',
        name: 'Earning',
        data: sales_of_month_year_current,
      },
      {
        type: 'column',
        name: 'Expense',
        data: [
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
        ],
      },
      {
        type: 'line',
        name: 'Expense',
        data: sales_of_month_year_before,
      },
    ]
    salesReport.value = [
      {
        title: 'Ventas - '+year_selected.value,
        amount: "S/. " +resp.total_sales_year_current,
        avatarColor: 'primary',
        avatarIcon: 'ri-funds-line',
      },
      {
        title: 'Ventas - '+(Number(year_selected.value) - 1),
        amount: "S/. " +resp.total_sales_year_before,
        avatarColor: 'warning',
        avatarIcon: 'ri-money-dollar-circle-line',
      },
    ]
  } catch (error) {
    console.log(error);
  }
}

watch(year_selected,() => {
  sales_for_month_year();
})

const chartConfig = ref(null);

const series = ref([]);

const salesReport = ref([]);

onMounted(() => {
  sales_for_month_year();
})
</script>

<template>
  <VCard
    title="Sales x Year"
    subtitle="Total 85.4k Sales"
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

        </VCol>
      </VRow>
      <!-- <div class="mt-n8 me-n3">
        <MoreBtn :menu-list="moreList" />
      </div> -->
    </template>

    <VCardText>
      <VRow class="mb-12">
        <VCol
          v-for="sale in salesReport"
          :key="sale.title"
          cols="6"
        >
          <div class="d-flex align-center gap-x-3">
            <VAvatar
              rounded
              variant="tonal"
              :color="sale.avatarColor"
            >
              <VIcon :icon="sale.avatarIcon" />
            </VAvatar>
            <div>
              <div class="text-body-1">
                {{ sale.title }}
              </div>
              <h6 class="text-h6">
                {{ sale.amount }}
              </h6>
            </div>
          </div>
        </VCol>
      </VRow>

      <VueApexCharts
        id="weekly-sales-chart"
        type="line"
        height="225"
        :options="chartConfig"
        :series="series"
      />
    </VCardText>
  </VCard>
</template>

<style lang="scss">
#weekly-sales-chart {
  .apexcharts-series[rel="2"] {
    transform: translateY(-8px);
  }
}
</style>
