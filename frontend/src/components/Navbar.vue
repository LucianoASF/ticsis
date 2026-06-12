<template>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
    <div class="container-fluid">
      <router-link class="navbar-brand fw-bold" to="/">
        HelpDesk
      </router-link>

      <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbar"
      >
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbar">
        <ul class="navbar-nav me-auto">
          <li class="nav-item">
            <router-link class="nav-link" to="/">
              Dashboard
            </router-link>
          </li>

          <li class="nav-item">
            <router-link class="nav-link" to="/tickets">
              Chamados
            </router-link>
          </li>

          <li class="nav-item">
            <router-link class="nav-link" to="/tickets/new">
              Novo Chamado
            </router-link>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</template>