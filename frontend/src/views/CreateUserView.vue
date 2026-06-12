<script setup>
import { reactive } from 'vue'
import UserForm from '../components/UserForm.vue'
import { api } from '../../api.js'
import { useToast } from 'vue-toast-notification';

const $toast = useToast();


const user = reactive({
  name: '',
  email: '',
})

const save = async () => {
 try {
  const res = await api.post("/users", user)
  $toast.success("Usuário cadastrado com sucesso.")
} catch (error) {
   $toast.error(error.response?.data?.errors || error.response?.data?.error || "Erro inesperado")
 }
}
</script>

<template>
  <UserForm
    :user="user"
    title="Criar Usuário"
    @submit="save"
  />
</template>