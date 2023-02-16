import { installTheme } from 'daisyui-vue'

// makes lottie api available from this.$lottie in a nuxt application
export default defineNuxtPlugin((nuxtApp) => {
  nuxtApp.vueApp.use(installTheme)
})
