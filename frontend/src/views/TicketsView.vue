<script setup>
import { onMounted, ref, watch } from 'vue';
import TicketTable from '../components/TicketTable.vue';
import { api } from '../../api.js';
import { useToast } from 'vue-toast-notification';
import Loading from '../components/Loading.vue';
import Pagination from '../components/Pagination.vue';

const data = ref({});
const isLoading = ref(false)
const $toast = useToast();
const page = ref(1)

const statusMap = {
  OPEN: "Aberto",
  IN_PROGRESS: "Em andamento",
  RESOLVED: "Resolvido",
  CLOSED: "Fechado"
};

const priorityMap = {
  LOW: "Baixa",
  MEDIUM: "Média",
  HIGH: "Alta",
  URGENT: "Urgente"
};



async function fetchTickets()  {
  isLoading.value = true
  try {
    const res = await api.get(`/tickets/?page=${page.value}`)
    
    data.value =  { ...res.data,  tickets: res.data.tickets.map(t => ({
        ...t,
        status: statusMap[t.status] || t.status,
        priority: priorityMap[t.priority] || t.priority
      }))}
      
  } catch (error) {
     $toast.error(error.response?.data?.errors || error.response?.data?.error || "Erro inesperado")
  } finally {
  isLoading.value = false
}
}
onMounted(fetchTickets)
watch(page, fetchTickets)

const deleteTicket = async (id) => {
  try {
    await api.delete(`/tickets/${id}`)
    fetchTickets()
    $toast.success("Deletado com sucesso")
  } catch (error) {
    $toast.error(error.response?.data?.errors || error.response?.data?.error || "Erro inesperado")
  }
}

</script>

<template>
  <Loading v-if="isLoading"/>
    <div class=" m-5 p-2" v-else>
        <h1 class="text-center mb-2">Tickets</h1>
        <TicketTable @delete="deleteTicket" :all-tickets="true" :data="data"/>
        <Pagination :total-pages="data.total_pages" v-model="page"/>
    </div>
</template>

