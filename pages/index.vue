<script setup lang="ts">
definePageMeta({
  layout: 'home',
})
</script>

<template lang="pug">
.overflow-hidden
  HomeScreenIntroduceSection
  HomeScreenLearnAndGrowSection(v-motion-slide-visible-once-right)
</template>

<style lang="stylus" scoped></style>
