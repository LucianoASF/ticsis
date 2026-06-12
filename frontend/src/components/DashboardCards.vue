<template>
  <div class="row g-4 mb-4">
    <div class="col-md-3">
      <div class="card shadow-sm h-100">
        <div class="card-body">
          <h6 class="text-muted mb-2">Abertos</h6>
          <h2 class="fw-bold">{{ open }}</h2>
        </div>
      </div>
    </div>

    <div class="col-md-3">
      <div class="card shadow-sm h-100">
        <div class="card-body">
          <h6 class="text-muted mb-2">Em andamento</h6>
          <h2 class="fw-bold">{{ inProgress }}</h2>
        </div>
      </div>
    </div>

    <div class="col-md-3">
      <div class="card shadow-sm h-100">
        <div class="card-body">
          <h6 class="text-muted mb-2">Resolvidos</h6>
          <h2 class="fw-bold">{{ resolved }}</h2>
        </div>
      </div>
    </div>

    <div class="col-md-3">
      <div class="card shadow-sm h-100">
        <div class="card-body">
          <h6 class="text-muted mb-2">Críticos</h6>
          <h2 class="fw-bold">{{ critical }}</h2>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
defineProps({
  open: {
    type: Number,
    required: true,
  },
  inProgress: {
    type: Number,
    required: true,
  },
  resolved: {
    type: Number,
    required: true,
  },
  critical: {
    type: Number,
    required: true,
  },
});
</script>