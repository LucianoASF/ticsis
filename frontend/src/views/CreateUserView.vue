<script setup>
import { reactive } from 'vue'
import UserForm from '../components/UserForm.vue'
import { api } from '../../api.js'



const user = reactive({
  name: '',
  email: '',
})

const save = async () => {
 try {
  const res = await api.post("/users", user)
  alert("Usuário cadastrado com sucesso")
 } catch (error) {
   alert("Ocorreu um erro")

 }
}
</script>

<template>
  <UserForm
    :user="user"
    @submit="save"
  />
</template>