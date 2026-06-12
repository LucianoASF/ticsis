import { createRouter, createWebHistory } from 'vue-router';
import DashboardView from './views/DashboardView.vue';
import TicketsView from './views/TicketsView.vue';
import CreateUserView from './views/CreateUserView.vue';
import UsersView from './views/UsersView.vue';
import EditUserView from './views/EditUserView.vue';

const routes = [
  { path: '/', component: DashboardView },
  { path: '/tickets', component: TicketsView },
  { path: '/users', component: UsersView },
  { path: '/users/new', component: CreateUserView },
  { path: '/users/:id', component: EditUserView },
];

export const router = createRouter({
  history: createWebHistory(),
  routes,
});
