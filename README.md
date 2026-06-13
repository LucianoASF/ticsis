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

O frontend consome a API REST utilizando Axios, realizando operações:

* GET /tickets
* GET /tickets/:id
* POST /tickets
* PUT /tickets/:id
* DELETE /tickets/:id
  
* GET /users
* GET /users/paginated
* GET /users/:id
* POST /users
* PUT /users/:id
* DELETE /users/:id
  
* GET /dashboard
  

---


## 🧑‍💻 Autor

Desenvolvido por Luciano Augusto de Souza Filho
GitHub: https://github.com/LucianoASF

---

## 📷 Prints

<img width="1913" height="921" alt="Captura de tela 2026-06-13 000807" src="https://github.com/user-attachments/assets/4c6714bb-2485-4b02-b0ac-f95e1729e3cb" />
<img width="1912" height="922" alt="Captura de tela 2026-06-13 000823" src="https://github.com/user-attachments/assets/3fff6fd8-3a4c-4fcf-bcbf-42bb19da99db" />
<img width="1913" height="917" alt="Captura de tela 2026-06-13 000843" src="https://github.com/user-attachments/assets/1eadbb44-3700-46c4-ad5f-24b48a34298e" />
<img width="1917" height="911" alt="Captura de tela 2026-06-13 000858" src="https://github.com/user-attachments/assets/cecfef18-18d0-4c0e-a5ac-cca47e282d49" />
<img width="1906" height="912" alt="Captura de tela 2026-06-13 000928" src="https://github.com/user-attachments/assets/89277450-ad33-4123-b4be-ff8748e10212" />
<img width="1912" height="912" alt="Captura de tela 2026-06-13 000945" src="https://github.com/user-attachments/assets/aa447852-4fda-456a-bf0d-c4a2bdf750ff" />

