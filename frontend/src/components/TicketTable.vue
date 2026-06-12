<template>
  <div class="card shadow-sm">
    <div class="card-header" v-if="!allTickets">
      Últimos Tickets
    </div>

    <div class="table-responsive">
      <h5 v-if="!tickets" class="w-100 text-center" >Nenhum ticket encontrado!</h5>
      <table class="table table-hover mb-0" v-else>
        <thead>
          <tr>
            <th>Título</th>
            <th>Prioridade</th>
            <th>Status</th>
            <th>Responsável</th>
          </tr>
        </thead>

        <tbody>
          
          <tr
            v-for="ticket in tickets"
            :key="ticket.id"
          >
          
            <td>{{ ticket.title }}</td>
            <td>{{ ticket.priority }}</td>
            <td>{{ ticket.status }}</td>
            <td>{{ ticket.user?.name }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script setup>
defineProps({
  tickets: {
    type: Array,
    required: false
  },
  allTickets: Boolean
})


</script>