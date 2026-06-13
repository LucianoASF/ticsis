<template>
  <div class="card shadow-sm h-100">
    <div class="card-header">Usuários com mais Tickets</div>

    <h5 v-if="topUsers.length === 0" class="w-100 text-center">
      Nenhum usuário encontrado!
    </h5>
    <div v-else class="table-responsive">
      <table class="table table-hover mb-0">
        <thead>
          <tr>
            <th style="width: 60%">Nome</th>
            <th class="text-end">Número de Tickets</th>
          </tr>
        </thead>

        <tbody>
          <tr v-for="topUser in topUsers" :key="topUser.id">
            <td>{{ topUser.name }}</td>
            <td class="text-end">{{ topUser.tickets_count }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script setup>
defineProps({
  topUsers: {
    type: Array,
    default: () => [],
  },
})
</script>
