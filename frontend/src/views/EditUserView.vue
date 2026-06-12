<script setup>
import { onMounted, reactive, ref } from 'vue'
import UserForm from '../components/UserForm.vue'
import { api } from '../../api.js'
import { useToast } from 'vue-toast-notification';
import { useRoute, useRouter } from 'vue-router';
import Loading from '../components/Loading.vue';

const $toast = useToast();
const route = useRoute()
const router = useRouter()
const isLoadingGet = ref(false)
const isLoadingSave = ref(false)

const id = route.params.id

const user = reactive({
  name: '',
  email: '',
})

onMounted(async () => {
  isLoadingGet.value = true
  try {
    const res = await api.get(`/users/${id}`)
    user.name = res.data.name
    user.email = res.data.email
  } catch (error) {
   return;
  } finally {
  isLoadingGet.value = false
 }
})

const save = async () => {
  isLoadingSave.value = true
 try {
  const res = await api.patch(`/users/${id}`, user)
  $toast.success("Usuário editado com sucesso.")
  router.push("/users")
} catch (error) {
   $toast.error(error.response?.data?.errors || error.response?.data?.error || "Erro inesperado")
 } finally {
  isLoadingSave.value = false
 }
}
</script>

<template>
  <Loading v-if="isLoadingGet"/>
  <div class="d-flex align-items-center justify-content-center flex-grow-1 flex-column" v-else-if="!user.name || !user.email" >
    <h1>Usuário não encontrado!</h1>
    <button class="btn btn-primary">
      <router-link to="/users" class="text-decoration-none text-black">Ir para listagem de usuários</router-link>
    </button>
  </div>
  <UserForm v-else
    :user="user"
    :loading="isLoadingSave"
    title="Editar Usuário"
    @submit="save"
  />
</template>