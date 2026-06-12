import { createRouter, createWebHistory } from 'vue-router';
import DashboardView from './views/DashboardView.vue';
import TicketsView from './views/TicketsView.vue';

const routes = [
  { path: '/', component: DashboardView },
  { path: '/tickets', component: TicketsView },
];

export const router = createRouter({
  history: createWebHistory(),
  routes,
});
