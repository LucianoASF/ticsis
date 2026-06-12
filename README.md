# TicSis — Sistema de Gerenciamento de Tickets

Sistema full stack para gerenciamento de tickets, desenvolvido com **Ruby on Rails (API)** no backend e **Vue.js** no frontend.

---

## 📌 Sobre o Projeto

O **TicSis** é uma aplicação para criação, acompanhamento e gerenciamento de tickets de suporte.

---

## 🚀 Tecnologias Utilizadas

### Backend

* Ruby on Rails (API Mode)
* MYSQL
* Active Record
* Rails Serializers / JSON responses

### Frontend

* Vue.js
* Axios
* Bootstrap
* Vue Router

---

## ⚙️ Funcionalidades

* CRUD completo de tickets
* CRUD de usuários
* Atribuição de responsáveis aos tickets
* Atualização de status dos tickets
* Atualização de prioridade dos tickets
* Listagem com paginação
* Validações no backend e frontend
* Tratamento de erros com mensagens padronizadas
* Interface responsiva e componentizada

---

## 🧱 Arquitetura

### Backend (Rails API)

O projeto segue uma estrutura organizada baseada em responsabilidades:

* Controllers → Entrada da API
* Models → Regras de negócio e validações
* Serializers / JSON → Padronização das respostas

### Frontend (Vue.js)

* Componentização reutilizável
* Comunicação com API via Axios
* Controle de estado reativo
* Separação entre páginas e componentes

---

## 📦 Instalação e Execução

### Backend (Rails API)

```bash
bundle install
rails db:create
rails db:migrate
rails db:seed
rails s
```

---

### Frontend (Vue)

```bash
npm install
npm run dev
```

---

## 🔗 Integração

O frontend consome a API REST utilizando Axios, realizando operações como:

* GET /tickets
* POST /tickets
* PUT /tickets/:id
* DELETE /tickets/:id

---


## 🧑‍💻 Autor

Desenvolvido por Luciano Augusto de Souza Filho
GitHub: https://github.com/LucianoASF

---
