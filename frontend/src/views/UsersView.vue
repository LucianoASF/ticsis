<template>
        <div class=" m-5 p-2 flex-grow-1">
        <h1 class="text-center mb-2">Usuários</h1>
  <div class="card shadow-sm">
   

    <div class="table-responsive">
      <h5 v-if="!data.users" class="w-100 text-center" >Nenhum usuário encontrado!</h5>
      <table class="table table-hover mb-0" v-else>
        <thead>
          <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Email</th>
            <th>Ações</th>
          </tr>
        </thead>

        <tbody>
          
          <tr
            v-for="user in data.users"
            :key="user.id"
            class="align-middle"
          >
          
            <td>{{ user.id }}</td>
            <td>{{ user.name }}</td>
            <td>{{ user.email }}</td>
            <td>
              <button @click="deleteUser(user.id)" class="btn btn-link text-danger"><Trash2/></button>
              <router-link class="text-success"  :to="`/users/${user.id}`">
              <Edit />
            </router-link>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
  <div class="mt-4"><Pagination :total-pages="data.total_pages" v-model="page" /></div>
  </div>
</template>

<script setup>
import { onMounted, ref, watch } from 'vue';
import { api } from '../../api';
import Pagination from '../components/Pagination.vue';
import { Edit, Trash2 } from '@lucide/vue';
import { useToast } from 'vue-toast-notification';


const data = ref({});
const page = ref(1)
const $toast = useToast();


   const fetchUsers = async () => {
  try {
    const res = await api.get(`/users?page=${page.value}`)
    data.value = res.data
  } catch (error) {
   $toast.error(error.response?.data?.errors || error.response?.data?.error || "Erro inesperado")
  }
}

onMounted(fetchUsers)
watch(page, fetchUsers)

const deleteUser = async (id) => {
  try {
    await api.delete(`/users/${id}`)
    fetchUsers()
    $toast.success("Deletado com sucesso")
  } catch (error) {
    $toast.error(error.response?.data?.errors || error.response?.data?.error || "Erro inesperado")
  }
}



</script>