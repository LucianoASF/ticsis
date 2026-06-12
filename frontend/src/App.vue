<script setup>
import { RouterView } from 'vue-router';
import Navbar from './components/Navbar.vue';
</script>

<template>
 <div class="d-flex flex-column min-vh-100">
    <Navbar/>
   <main class="d-flex flex-column flex-grow-1"> <RouterView /></main>
 </div>
</template>
