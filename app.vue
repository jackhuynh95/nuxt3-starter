<script setup>
useHead({
  title: 'Nuxt',
  link: [
    {
      rel: 'icon',
      type: 'image/png',
      href: '/nuxt.png',
    },
  ],
  meta: [
    {
      property: 'og:type',
      content: 'website',
    },
    {
      property: 'og:title',
      content: 'Nuxt',
    },
    {
      property: 'og:description',
      content: 'The Intuitive Vue Frameworkeer',
    },
    {
      property: 'og:image',
      content: '/thumbnail.png',
    },
    {
      name: 'keywords',
      content: 'The Intuitive Vue Frameworkeer',
    },
  ],
})

const nuxtApp = useNuxtApp()

// scrollToTop
nuxtApp.hook('page:finish', () => {
  window.scrollTo(0, 0)
})
</script>

<template>
  <NuxtLayout>
    <NuxtPage />
  </NuxtLayout>
</template>

<style>
html,
body,
#__nuxt {
  height: 100vh;
  margin: 0;
  padding: 0;
}

html.dark {
  background: #222;
  color: white;
}

html {
  scroll-behavior: smooth; /* set scroll-behaviour to smooth here */
  font-family: 'Montserrat';
}
</style>
