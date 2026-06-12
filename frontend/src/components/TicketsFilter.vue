<template>
  <div class="card shadow-sm mb-4">
    <div class="card-body">
      <div class="row g-3">
        <div class="col-md-3">
          <input
            class="form-control"
            placeholder="Pesquisar chamado..."
          >
        </div>

        <div class="col-md-3">
          <select class="form-select">
            <option>Status</option>
            <option>Aberto</option>
            <option>Em andamento</option>
            <option>Resolvido</option>
          </select>
        </div>

        <div class="col-md-3">
          <select class="form-select">
            <option>Prioridade</option>
            <option>Baixa</option>
            <option>Média</option>
            <option>Alta</option>
            <option>Crítica</option>
          </select>
        </div>

        <div class="col-md-3">
          <button class="btn btn-primary w-100">
            Filtrar
          </button>
        </div>
      </div>
    </div>
  </div>
</template>