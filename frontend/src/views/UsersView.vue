<template>
  <Loading v-if="isLoading" />
  <div v-else class="m-5 p-2 flex-grow-1">
    <h1 class="text-center mb-2">Usuários</h1>
    <div class="card shadow-sm">
      <div class="table-responsive">
        <h5 v-if="!data.users" class="w-100 text-center">
          Nenhum usuário encontrado!
        </h5>
        <table v-else class="table table-hover mb-0">
          <thead>
            <tr>
              <th>ID</th>
              <th>Nome</th>
              <th>Email</th>
              <th>Ações</th>
            </tr>
          </thead>

          <tbody>
            <tr v-for="user in data.users" :key="user.id" class="align-middle">
              <td>{{ user.id }}</td>
              <td>{{ user.name }}</td>
              <td>{{ user.email }}</td>
              <td>
                <button
                  class="btn btn-link text-danger"
                  @click="deleteUser(user.id)"
                >
                  <Trash2 />
                </button>
                <router-link class="text-success" :to="`/users/${user.id}`">
                  <Edit />
                </router-link>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
    <div class="mt-4">
      <Pagination v-model="page" :total-pages="data.total_pages" />
    </div>
  </div>
</template>

<script setup>
import { computed, onMounted, ref, watch } from 'vue'
import { api } from '../../api'
import Pagination from '../components/Pagination.vue'
import { Edit, Trash2 } from '@lucide/vue'
import { useToast } from 'vue-toast-notification'
import Loading from '../components/Loading.vue'
import { useRoute, useRouter } from 'vue-router'

const isLoading = ref(false)
const data = ref({})
const router = useRouter()
const route = useRoute()
const page = computed({
  get: () => Number(route.query.page) || 1,
  set: (value) => {
    router.replace({
      query: {
        ...route.query,
        page: value,
      },
    })
  },
})
const $toast = useToast()

const fetchUsers = async () => {
  isLoading.value = true
  try {
    const res = await api.get(`/users/pagined?page=${page.value}`)
    data.value = res.data
  } catch (error) {
    $toast.error(
      error.response?.data?.errors ||
        error.response?.data?.error ||
        'Erro inesperado'
    )
  } finally {
    isLoading.value = false
  }
}

onMounted(fetchUsers)
watch(page, fetchUsers)

const deleteUser = async (id) => {
  try {
    await api.delete(`/users/${id}`)
    fetchUsers()
    $toast.success('Deletado com sucesso')
  } catch (error) {
    $toast.error(
      error.response?.data?.errors ||
        error.response?.data?.error ||
        'Erro inesperado'
    )
  }
}
</script>
