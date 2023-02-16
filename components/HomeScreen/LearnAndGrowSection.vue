<script setup lang="ts">
</script>

<template lang="pug">
.px-6.bg-black(class='md:py-[150px] py-[30px] md:px-0')
  .text-center.text-white.font-bold.text-lg.uppercase(
    class='md:text-[61px] md:leading-[70px]'
  )
    div(class='md:space-y-[75px] space-y-[40px]')
      ClientOnly
        Vue3Marquee.overflow-hidden
          .gap-4.flex.flex-row.items-center
            .flex-1.animate-pulse.bg-gradient-to-l(
              class='from-[#CBDAFF] to-blue-[#E6F0FD] h-[25px]'
            )
              .invisible Empty

            div Content 1

            .flex-1.animate-pulse.bg-gradient-to-l(
              class='from-[#CBDAFF] to-blue-[#E6F0FD] h-[25px]'
            )
              .invisible Empty

            div Content 2

            .flex-1.animate-pulse.bg-gradient-to-r(
              class='from-[#CBDAFF] to-blue-[#E6F0FD] h-[25px]'
            )
              .invisible Empty

            div Content 3

      ClientOnly
        Vue3Marquee.overflow-hidden
          .gap-4.flex.flex-row.items-center
            .flex-1.animate-pulse.bg-gradient-to-l(
              class='from-[#CBDAFF] to-blue-[#E6F0FD] h-[25px]'
            )
              .invisible Empty

            div Content 4

            .flex-1.animate-pulse.bg-gradient-to-l(
              class='from-[#CBDAFF] to-blue-[#E6F0FD] h-[25px]'
            )
              .invisible Empty

            div Content 5

            .flex-1.animate-pulse.bg-gradient-to-r(
              class='from-[#CBDAFF] to-blue-[#E6F0FD] h-[25px]'
            )
              .invisible Empty

            div Content 6

      ClientOnly
        Vue3Marquee.overflow-hidden
          .gap-4.flex.flex-row.items-center
            .flex-1.animate-pulse.bg-gradient-to-l(
              class='from-[#CBDAFF] to-blue-[#E6F0FD] h-[35px]'
            )
              .invisible Empty

            div Content 7

            .flex-1.animate-pulse.bg-gradient-to-l(
              class='from-[#CBDAFF] to-blue-[#E6F0FD] h-[35px]'
            )
              .invisible Empty

            div Content 8
</template>

<style lang="stylus" scoped></style>
