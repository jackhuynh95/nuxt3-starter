<script setup lang="ts">
import { useGesture } from '@vueuse/gesture'
import type { PermissiveMotionProperties } from '@vueuse/motion'

const container = ref()
const box = ref()

const { motionProperties: boxProperties } = useMotionProperties(box, {
  y: 0,
  x: 0,
})

const { set: boxSet } = useSpring(
  boxProperties as Partial<PermissiveMotionProperties>,
  {
    damping: 50,
    stiffness: 220,
  },
)

const moveHandler = ({ event, moving, ...state }) => {
  // boxRect is coming from the getBoundingClientRect() of the parent element.
  const boxRect = container.value.getBoundingClientRect()
  const x = event.pageX - boxRect.left - boxRect.width / 2
  const y = event.pageY - boxRect.top - boxRect.height / 2

  boxSet({
    x,
    y,
  })
}

const moveEndHandler = () => {
  boxSet({
    x: 0,
    y: 0,
  })
}

useGesture(
  {
    onMove: moveHandler,
    onHover: moveEndHandler,
    // onScrollEnd: moveEndHandler,
    // onWheelEnd: moveEndHandler,
  },
  { domTarget: container },
)
</script>

<template lang="pug">
.relative.w-full.h-full.flex.items-center.justify-center.overflow-hidden(
  ref='container'
)
  //- .absolute.h-4.w-4.border-4.rounded-lg.bg-primary(
  //- ref='box'
  //- class='border-blue-[#E6F0FD]'
  //- )
  .absolute(ref='box')
    .flex.justify-center.border-2.border-current(
      class='w-[24px] h-[36px] rounded-[34px]'
    )
      .bg-current.animate-scroll(class='w-[4px] h-[8px] rounded-[12px]')
</template>

<style lang="stylus" scoped></style>
