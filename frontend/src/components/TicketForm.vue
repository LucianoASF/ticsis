<template>
  <div class="d-flex justify-content-center align-items-center flex-grow-1">
    <div class="card shadow-sm w-100" style="max-width: 600px">
      <div class="card-header">Formulário de Ticket</div>

      <div class="card-body">
        <form @submit.prevent="$emit('submit', form)">
          <div class="mb-3">
            <label class="form-label">Título</label>

            <input
              v-model="form.title"
              class="form-control"
              type="text"
              required
              minlength="5"
            />
          </div>

          <div class="mb-3">
            <label class="form-label">Descrição</label>

            <textarea
              v-model="form.description"
              class="form-control"
              rows="5"
              required
              minlength="10"
            />
          </div>

          <div class="mb-3">
            <label class="form-label">Prioridade</label>

            <select v-model="form.priority" class="form-select" required>
              <option disabled value="">Selecione a prioridade</option>

              <option value="LOW">Baixa</option>
              <option value="MEDIUM">Média</option>
              <option value="HIGH">Alta</option>
              <option value="CRITICAL">Crítica</option>
            </select>
          </div>
          <div v-if="isEditting" class="mb-3">
            <label class="form-label">Status</label>
            <select v-model="form.status" class="form-select" required>
              <option disabled value="">Selecione o status</option>
              <option value="OPEN">Aberto</option>
              <option value="IN_PROGRESS">Em Progrsso</option>
              <option value="RESOLVED">Resolvido</option>
              <option value="CLOSED">Fechado</option>
            </select>
          </div>
          <div v-else class="mb-3">
            <label for="user" class="form-label">Responsável</label>

            <select
              id="user"
              v-model="form.user_id"
              class="form-select"
              required
            >
              <option disabled value="">Selecione um responsável</option>

              <option v-for="user in users" :key="user.id" :value="user.id">
                #{{ user.id }} - {{ user.name }} ({{ user.email }})
              </option>
            </select>
          </div>

          <button
            type="submit"
            class="btn btn-primary w-100"
            :disabled="isSubmitting"
          >
            <span
              v-if="isSubmitting"
              class="spinner-border spinner-border-sm me-2"
            ></span>
            <span v-if="isSubmitting">Salvando...</span>
            <span v-else>Salvar</span>
          </button>
        </form>
      </div>
    </div>
  </div>
</template>

<script setup>
import { reactive } from 'vue'

const props = defineProps({
  ticket: {
    type: Object,
    required: true,
  },
  users: {
    type: Array,
    default: () => [],
  },
  isEditting: {
    type: Boolean,
    default: false,
  },
  isSubmitting: {
    type: Boolean,
    required: true,
  },
})

const form = reactive({
  title: props.ticket?.title || '',
  description: props.ticket?.description || '',
  priority: props.ticket?.priority || '',
  status: props.ticket?.status,
  user_id: props.ticket?.user_id || '',
})

defineEmits(['submit'])
</script>
