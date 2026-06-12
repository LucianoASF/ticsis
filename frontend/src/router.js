import { createRouter, createWebHistory } from 'vue-router';
import DashboardView from './views/DashboardView.vue';
import TicketsView from './views/TicketsView.vue';
import CreateUserView from './views/CreateUserView.vue';

const routes = [
  { path: '/', component: DashboardView },
  { path: '/tickets', component: TicketsView },
  { path: '/users/new', component: CreateUserView },
];

export const router = createRouter({
  history: createWebHistory(),
  routes,
});
