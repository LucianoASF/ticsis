<script setup>
import { reactive, ref } from 'vue'
import UserForm from '../components/UserForm.vue'
import { api } from '../../api.js'
import { useToast } from 'vue-toast-notification';

const $toast = useToast();
const isLoading = ref(false)


const user = reactive({
  name: '',
  email: '',
})

const save = async () => {
  isLoading.value = true
 try {
  const res = await api.post("/users", user)
  $toast.success("Usuário cadastrado com sucesso.")
} catch (error) {
   $toast.error(error.response?.data?.errors || error.response?.data?.error || "Erro inesperado")
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