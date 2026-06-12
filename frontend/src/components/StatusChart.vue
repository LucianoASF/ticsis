<template>
  <div class="card shadow-sm h-100">
    <div class="card-header">
      Chamados por Status
    </div>

    <div class="card-body text-center">
      <h5 class="mb-4">Resumo</h5>

      <div class="mb-3">
        <strong>Abertos:</strong> {{ open }}
      </div>

      <div class="mb-3">
        <strong>Em andamento:</strong> {{ inProgress }}
      </div>

      <div>
        <strong>Resolvidos:</strong> {{ resolved }}
      </div>
    </div>
  </div>
</template>

<script setup>
defineProps({
  open: Number,
  inProgress: Number,
  resolved: Number
})
</script>