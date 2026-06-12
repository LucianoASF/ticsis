<script setup>
import { onMounted, ref } from 'vue'
import TicketForm from '../components/TicketForm.vue'
import { api } from '../../api.js'
import { useRoute, useRouter } from 'vue-router'
import { useToast } from 'vue-toast-notification'
import Loading from '../components/Loading.vue'

const $toast = useToast()
const ticket = ref({})
const route = useRoute()
const router = useRouter()
const isLoading = ref(false)
const isSubmitting = ref(false)

const id = route.params.id

onMounted(async () => {
  isLoading.value = true
  try {
    const res = await api.get(`/tickets/${id}`)
    ticket.value = res.data
  } catch (error) {
    $toast.error(
      error.response?.data?.errors ||
        error.response?.data?.error ||
        'Erro inesperado'
    )
  } finally {
    isLoading.value = false
  }
})
const save = async (form) => {
  isSubmitting.value = true
  try {
    await api.patch(`/tickets/${id}`, form)
    $toast.success('Ticket alterdo com sucesso')
    router.push('/tickets')
  } catch (error) {
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
  <Loading v-if="isLoading" />
  <div
    v-else-if="!ticket.id"
    class="d-flex align-items-center justify-content-center flex-grow-1 flex-column"
  >
    <h1>Ticket não encontrado!</h1>
    <button class="btn btn-primary">
      <router-link to="/tickets" class="text-decoration-none text-black"
        >Ir para listagem de tickets</router-link
      >
    </button>
  </div>
  <TicketForm
    v-else
    :ticket="ticket"
    :is-submitting="isSubmitting"
    is-editting
    @submit="save"
  />
</template>
