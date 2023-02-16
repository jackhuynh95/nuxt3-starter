<script setup lang="ts">
</script>

<template lang="pug">
.container.mx-auto.px-6(class='md:py-[150px] py-[30px] md:px-0')
  .text-center.font-bold.whitespace-pre-line.mb-4.text-(
    style='word-break: break-word'
    class='md:text-[40px] md:leading-[50px] text-[30px]'
  )
    span Join the community

  ClientOnly
    Vue3Marquee
      .grid.h-20.flex-grow.place-items-center.px-5
        img(src='@/assets/homeScreen/deloitte.png')
      .grid.h-20.flex-grow.place-items-center.px-5
        img(src='@/assets/homeScreen/truedigital.png')
      .grid.h-20.flex-grow.place-items-center.px-5
        img(src='@/assets/homeScreen/fulbright.png')
      .grid.h-20.flex-grow.place-items-center.px-5
        img(src='@/assets/homeScreen/penn.png')
      .grid.h-20.flex-grow.place-items-center.px-5
        img(src='@/assets/homeScreen/pwc.png')
      .grid.h-20.flex-grow.place-items-center.px-5
        img(src='@/assets/homeScreen/vietcapital.png')
</template>

<style lang="stylus" scoped></style>
