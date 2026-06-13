<template>
  <div class="card shadow-sm mb-4">
    <div v-if="!allTickets" class="card-header">Últimos Tickets</div>

    <div class="table-responsive">
      <h5 v-if="tickets.length === 0" class="w-100 text-center">
        Nenhum ticket encontrado!
      </h5>
      <table v-else class="table table-hover mb-0">
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
          <tr v-for="ticket in tickets" :key="ticket.id" class="align-middle">
            <td>{{ ticket.title }}</td>
            <td>{{ ticket.priority }}</td>
            <td>{{ ticket.status }}</td>
            <td>{{ ticket.user?.name }}</td>
            <td v-if="allTickets">
              <button
                class="btn btn-link text-danger"
                @click="handleDelete(ticket.id)"
              >
                <Trash2 />
              </button>
              <router-link class="text-success" :to="`/tickets/${ticket.id}`">
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
import { Edit, Trash2 } from '@lucide/vue'

defineProps({
  tickets: {
    type: Array,
    default: () => [],
  },
  allTickets: Boolean,
})
const emit = defineEmits(['delete'])

function handleDelete(id) {
  emit('delete', id)
}
</script>
