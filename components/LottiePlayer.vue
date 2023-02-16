<script setup lang="ts">
import type { LottiePlayer } from 'lottie-web'

const props = defineProps({
  path: {
    type: String,
    default: '',
  },
})

const lottie = inject('lottie') as LottiePlayer
const animationElement = ref<HTMLElement | null>(null)

onMounted(() => {
  lottie.loadAnimation({
    container: animationElement.value as HTMLElement, // the dom element that will contain the animation
    loop: true,
    autoplay: true,
    path: props.path, // the path to the animation json
  })
})
</script>

<template lang="pug">
.animation(ref='animationElement')
</template>

<style lang="stylus" scoped></style>
