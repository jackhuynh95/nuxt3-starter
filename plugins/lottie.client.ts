import lottie from 'lottie-web'

// makes lottie api available from this.$lottie in a nuxt application
export default defineNuxtPlugin((nuxtApp) => {
  nuxtApp.vueApp.provide('lottie', lottie)
})
