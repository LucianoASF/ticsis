<template>
  <div class="card shadow-sm mb-4">
    <div class="card-header" v-if="!allTickets">
      Últimos Tickets
    </div>

    <div class="table-responsive">
      <h5 v-if="!data.tickets" class="w-100 text-center" >Nenhum ticket encontrado!</h5>
      <table class="table table-hover mb-0" v-else>
        <thead>
          <tr>
            <th>Título</th>
            <th>Prioridade</th>
            <th>Status</th>
            <th>Responsável</th>
            <th v-if="allTickets">Ações</th>
          </tr>
        </thead>

        <tbody>
          
          <tr
            v-for="ticket in data.tickets"
            :key="ticket.id"
            class="align-middle"
          >
            <td>{{ ticket.title }}</td>
            <td>{{ ticket.priority }}</td>
            <td>{{ ticket.status }}</td>
            <td>{{ ticket.user?.name }}</td>
            <td>
              <button @click="handleDelete(ticket.id)" class="btn btn-link text-danger"><Trash2/></button>
              <router-link class="text-success"  :to="`/tickets/${ticket.id}`">
              <Edit />
            </router-link>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script setup>
import { Edit, Trash2 } from '@lucide/vue';

  

defineProps({
  data: {
    type: Object,
    required: false
  },
  allTickets: Boolean
})
const emit = defineEmits(["delete"])

function handleDelete(id){
  emit("delete", id)
}

const deleteTicket = async (id) => {
  try {
    await api.delete(`/tickets/${id}`)
    fetchUsers()
    $toast.success("Deletado com sucesso")
  } catch (error) {
    $toast.error(error.response?.data?.errors || error.response?.data?.error || "Erro inesperado")
  }
}

</script>