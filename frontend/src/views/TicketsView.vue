<script setup>
import { onMounted, ref } from 'vue';
import TicketTable from '../components/TicketTable.vue';
import { api } from '../../api.js';
import { useToast } from 'vue-toast-notification';

const data = ref({});
const $toast = useToast();

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


onMounted(async () => {
  try {
    const res = await api.get("/tickets")

  data.value = res.data.map(t => ({
        ...t,
        status: statusMap[t.status] || t.status,
        priority: priorityMap[t.priority] || t.priority
      }))
    
  } catch (error) {
     $toast.error(error.response?.data?.errors || error.response?.data?.error || "Erro inesperado")
  }
})

</script>

<template>
    <div class=" m-5 p-2">
        <h1 class="text-center mb-2">Tickets</h1>
        <TicketTable :all-tickets="true" :tickets="data"/>
    </div>
</template>

