<script setup>
import { HandHelping } from '@lucide/vue'
</script>

<template>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
    <div class="container-fluid">
      <router-link class="navbar-brand fw-bold" to="/">
        TicSis <hand-helping />
      </router-link>

      <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbar"
      >
        <span class="navbar-toggler-icon"></span>
      </button>

      <div id="navbar" class="collapse navbar-collapse">
        <ul class="navbar-nav me-auto">
          <li class="nav-item">
            <router-link class="nav-link" to="/"> Dashboard </router-link>
          </li>

          <li class="nav-item">
            <router-link class="nav-link" to="/tickets"> Tickets </router-link>
          </li>
          <li class="nav-item">
            <router-link class="nav-link" to="/users"> Usuários </router-link>
          </li>

          <li class="nav-item">
            <router-link class="nav-link" to="/tickets/new">
              Novo Ticket
            </router-link>
          </li>
          <li class="nav-item">
            <router-link class="nav-link" to="/users/new">
              Novo Usuário
            </router-link>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</template>
