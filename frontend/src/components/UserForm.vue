<template>
  <div class="d-flex justify-content-center align-items-center flex-grow-1">
    
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
          >
            Salvar
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
  }
})

defineEmits(['submit'])
</script>