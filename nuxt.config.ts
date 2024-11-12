export default defineNuxtConfig({
  routeRules: {
    '/': { prerender: true }, // Once per build (via builder)
  },

  modules: ['@vueuse/nuxt', '@vueuse/motion/nuxt', '@nuxtjs/tailwindcss', // '@nuxtjs/color-mode',
  '@pinia/nuxt', '@nuxtjs/google-fonts', 'nuxt-icon', '@/modules/sitemap', 'dayjs-nuxt', '@nuxtjs/device'],

  sitemap: {
    hostname: 'https://nuxtjs.org/',
  },

  experimental: {
    reactivityTransform: true,
    inlineSSRStyles: false,
  },

  css: ['vue3-carousel/dist/carousel.css', 'vue3-marquee/dist/style.css', { src: '~/styles/style.styl', lang: 'styl' }],

  // colorMode: {
  //   preference: 'system',
  //   dataValue: 'theme',
  //   classSuffix: '',
  // },
  googleFonts: {
    families: {
      'Montserrat': [400, 600, 700],
    },
  },

  compatibilityDate: '2024-11-12',
})