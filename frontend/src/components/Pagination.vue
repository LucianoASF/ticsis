<script setup>
import { ChevronLeft, ChevronRight } from '@lucide/vue'
import { computed } from 'vue'

const props = defineProps({
  modelValue: {
    type: Number,
    default: 1,
  },
  totalPages: {
    type: Number,
    default: 1,
  },
})

const emit = defineEmits(['update:modelValue'])

const currentPage = computed({
  get: () => props.modelValue,
  set: (val) => emit('update:modelValue', val),
})

const pages = computed(() => {
  const total = props.totalPages
  const current = currentPage.value

  const delta = 1

  const range = []
  const rangeWithDots = []

  let left = current - delta
  let right = current + delta

  for (let i = 1; i <= total; i++) {
    if (i === 1 || i === total || (i >= left && i <= right)) {
      range.push(i)
    }
  }

  let last

  for (const i of range) {
    if (last) {
      if (i - last === 2) {
        rangeWithDots.push(last + 1)
      } else if (i - last !== 1) {
        rangeWithDots.push('...')
      }
    }

    rangeWithDots.push(i)
    last = i
  }

  return rangeWithDots
})

function goTo(page) {
  if (page === '...') return
  if (page < 1 || page > props.totalPages) return
  currentPage.value = page
}
</script>

<template>
  <nav>
    <ul class="pagination justify-content-center">
      <!-- Previous -->
      <li class="page-item" :class="{ disabled: currentPage === 1 }">
        <button class="page-link" @click="goTo(currentPage - 1)">
          <ChevronLeft size="16" />
        </button>
      </li>

      <!-- Pages -->
      <li
        v-for="(page, index) in pages"
        :key="index"
        class="page-item"
        :class="{ active: page === currentPage }"
      >
        <button
          class="page-link"
          :disabled="page === '...'"
          @click="goTo(page)"
        >
          {{ page }}
        </button>
      </li>

      <!-- Next -->
      <li class="page-item" :class="{ disabled: currentPage === totalPages }">
        <button class="page-link" @click="goTo(currentPage + 1)">
          <ChevronRight size="16" />
        </button>
      </li>
    </ul>
  </nav>
</template>
