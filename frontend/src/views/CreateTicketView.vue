<script setup>
import { onMounted, ref } from 'vue'
import TicketForm from '../components/TicketForm.vue'
import { api } from '../../api.js'
import { useToast } from 'vue-toast-notification'

const ticket = ref({})
const users = ref([
  {
    id: 0,
    name: '',
    email: '',
  },
])
const $toast = useToast()
const isSubmitting = ref(false)

onMounted(async () => {
  const res = await api.get('/users')
  users.value = res.data
})

const save = async (form) => {
  isSubmitting.value = true
  try {
    await api.post('/tickets', form)
    $toast.success('Ticket criado com sucesso')

    Object.assign(form, {
      title: '',
      description: '',
      priority: '',
      status: '',
      user_id: '',
    })
  } catch (error) {
    console.log(error)
    $toast.error(
      error.response?.data?.errors ||
        error.response?.data?.error ||
        'Erro inesperado'
    )
  } finally {
    isSubmitting.value = false
  }
}
</script>

<template>
  <div class="flex justify-content-center flex-grow-1 mt-4">
    <h1 class="text-center">Criar Ticket</h1>
    <TicketForm
      :ticket="ticket"
      :is-submitting="isSubmitting"
      :users="users"
      @submit="save"
    />
  </div>
</template>
