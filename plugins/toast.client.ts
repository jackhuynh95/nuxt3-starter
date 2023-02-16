import { createToaster } from "@meforma/vue-toaster"

export default defineNuxtPlugin((nuxtApp) => {
  const toaster = createToaster({ /* options */ });
  nuxtApp.vueApp.provide('toaster', toaster)
})
