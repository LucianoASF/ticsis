<template>
  <div class="card shadow-sm">
    <div class="card-header">
      Últimos Tickets
    </div>

    <div class="table-responsive">
      <table class="table table-hover mb-0">
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
            <td>{{ ticket.user.name }}</td>
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
  }
})
</script>