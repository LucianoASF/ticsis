<template>
  <div class="container-fluid py-4">

    <h1 class="mb-4">
      Dashboard
    </h1>

    <DashboardCards
      :open="12"
      :in-progress="7"
      :resolved="25"
      :critical="3"
    />

    <TicketFilters />

    <div class="row mb-4">
      <div class="col-md-4">
        <StatusChart
          :open="12"
          :in-progress="7"
          :resolved="25"
        />
      </div>

      <div class="col-md-8">
        <TicketTable
          :tickets="tickets"
        />
      </div>
    </div>

  </div>
</template>

<script setup>
import DashboardCards from '../components/DashboardCards.vue'
import TicketFilters from '../components/TicketsFilter.vue'
import TicketTable from '../components/TicketTable.vue'
import StatusChart from '../components/StatusChart.vue'

const tickets = [
  {
    id: 1,
    title: 'Erro ao realizar login',
    priority: 'Alta',
    status: 'Aberto',
    user: 'João Silva'
  },
  {
    id: 2,
    title: 'Falha na impressão',
    priority: 'Média',
    status: 'Em andamento',
    user: 'Maria Souza'
  },
  {
    id: 3,
    title: 'Problema no ERP',
    priority: 'Crítica',
    status: 'Resolvido',
    user: 'Carlos Lima'
  }
]
</script>