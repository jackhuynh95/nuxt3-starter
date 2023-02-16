export default defineNuxtConfig({
  routeRules: {
    '/': { prerender: true }, // Once per build (via builder)
  },
  modules: [
    '@vueuse/nuxt',
    '@vueuse/motion/nuxt',
    '@nuxtjs/tailwindcss',
    '@nuxtjs/device',
    '@pinia/nuxt',
    // '@nuxtjs/color-mode',
    '@nuxtjs/dayjs',
    '@nuxtjs/google-fonts',
    'nuxt-icon',
    '@/modules/sitemap',
  ],
  sitemap: {
    hostname: 'https://nuxtjs.org/',
  },
  experimental: {
    reactivityTransform: true,
    inlineSSRStyles: false,
  },
  css: ['vue3-carousel/dist/carousel.css', 'vue3-marquee/dist/style.css', { src: '~/styles/style.styl', lang: 'styl' }],
  googleFonts: {
    families: {
      'Montserrat': [400, 600, 700],
    },
  },
  // colorMode: {
  //   preference: 'system',
  //   dataValue: 'theme',
  //   classSuffix: '',
  // },
})
