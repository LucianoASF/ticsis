<script setup>
import DashboardCards from '../components/DashboardCards.vue'
import TicketFilters from '../components/TicketsFilter.vue'
import TicketTable from '../components/TicketTable.vue'
import TopUsers from '../components/TopUsers.vue'
import { onMounted, ref } from 'vue'
import { api } from '../../api.js'
import { useToast } from 'vue-toast-notification'
import Loading from '../components/Loading.vue'

const statusMap = {
  OPEN: 'Aberto',
  IN_PROGRESS: 'Em andamento',
  RESOLVED: 'Resolvido',
  CLOSED: 'Fechado',
}

const priorityMap = {
  LOW: 'Baixa',
  MEDIUM: 'Média',
  HIGH: 'Alta',
  CRITICAL: 'Crítica',
}

const data = ref({})
const $toast = useToast()
const isLoading = ref(false)

onMounted(async () => {
  isLoading.value = true
  try {
    const res = await api.get('/dashboard')

    data.value = {
      ...res.data,
      latest_tickets: res.data.latest_tickets.map((t) => ({
        ...t,
        status: statusMap[t.status] || t.status,
        priority: priorityMap[t.priority] || t.priority,
      })),
    }
  } catch (error) {
    $toast.error(
      error.response?.data?.errors ||
        error.response?.data?.error ||
        'Erro inesperado'
    )
  } finally {
    isLoading.value = false
  }
})
</script>

<template>
  <Loading v-if="isLoading" />

  <div v-else class="container-fluid py-4">
    <h1 class="mb-4">Dashboard</h1>

    <DashboardCards
      :open="data?.status_count?.OPEN || 0"
      :in-progress="data?.status_count?.IN_PROGRESS || 0"
      :resolved="data?.status_count?.RESOLVED || 0"
      :closed="data?.status_count?.CLOSED || 0"
    />

    <div class="row mb-4">
      <div class="col-md-4">
        <TopUsers :top-users="data?.top_users" />
      </div>
      <div class="col-md-8">
        <TicketTable :tickets="data?.latest_tickets" />
      </div>
    </div>
  </div>
</template>
