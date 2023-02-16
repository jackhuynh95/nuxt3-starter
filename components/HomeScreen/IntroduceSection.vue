<script setup lang="ts">
const isVisible = ref(false)
</script>

<template lang="pug">
.relative.bg-gradient-to-l.px-6(class='from-[#00DC82] to-blue-[#00DC82] md:px-0')
  .absolute.inset-0
    GesturePlayer(v-if='$device.isDesktop' class='text-[#00DC82]')

  .absolute.inset-0.-z-10
    LottiePlayer.w-full.h-full(path='./lottie/star-composition.json')

  .flex.flex-col.justify-end(class='md:py-0 pt-[77px]' style='min-height: calc(100vh)')
    .flex.flex-1
      .grid.gap-4.mx-auto
        .self-center(class='space-y-[44px]')
          .group.font-bold.text-center.space-y-5(
            class='md:text-[150px] md:leading-[175px] text-[#FFFFFF] text-[48px]'
          ) 
            .flex.items-center.space-y-4.flex-col(
              class='md:flex-row md:space-x-4 md:space-y-0'
            )
              div
                div Nuxt 3
                div -Framework

            .sticky.inset-x-0.flex.items-center.justify-center
              button.btn.btn-outline.btn-secondary(
                class='md:btn-lg'
                @click='isVisible = true'
              ) Get Started

  HomeScreenEnterEmailModal(v-model:visible='isVisible')
</template>

<style lang="stylus" scoped></style>
