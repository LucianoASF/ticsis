<script setup>
import { reactive, ref } from 'vue'
import UserForm from '../components/UserForm.vue'
import { api } from '../../api.js'
import { useToast } from 'vue-toast-notification'

const $toast = useToast()
const isLoading = ref(false)

const user = reactive({
  name: '',
  email: '',
})

const save = async (form) => {
  isLoading.value = true
  try {
    await api.post('/users', form)
    $toast.success('Usuário cadastrado com sucesso.')
    Object.assign(form, {
      name: '',
      email: '',
    })
  } catch (error) {
    $toast.error(
      error.response?.data?.errors.join(', ') ||
        error.response?.data?.error ||
        'Erro inesperado'
    )
  } finally {
    isLoading.value = false
  }
}
</script>

<template>
  <UserForm
    :user="user"
    title="Criar Usuário"
    :loading="isLoading"
    @submit="save"
  />
</template>
