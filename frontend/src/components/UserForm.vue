<template>
  <div class="d-flex flex-column justify-content-center align-items-center flex-grow-1 gap-2">

    <h1>{{ title }}</h1>
    
    <div class="card shadow-sm w-100" style="max-width: 600px;">
      
      <div class="card-header">
        Formulário do Usuário
      </div>

      <div class="card-body">
        <form @submit.prevent="$emit('submit')">

          <div class="mb-3">
            <label class="form-label">Nome</label>

            <input
              v-model="user.name"
              class="form-control"
              type="text"
              required
            >
          </div>
          <div class="mb-3">
            <label class="form-label">Email</label>

            <input
              v-model="user.email"
              class="form-control"
              type="email"
              required
            >
          </div>
          <button
            type="submit"
            class="btn btn-primary w-100"
            :disabled="loading"
          >
          <span v-if="loading" class="spinner-border spinner-border-sm me-2"></span>
            <span v-if="loading">Salvando...</span>
            <span v-else>Salvar</span>
          </button>

        </form>
      </div>

    </div>

  </div>
</template>

<script setup>
defineProps({
  user: {
    type: Object,
    required: true
  },
  title: {
    type: String,
  required: true
  },
  loading: {
    type: Boolean,
    default: false
  }
})

defineEmits(['submit'])
</script>