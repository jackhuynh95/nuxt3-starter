<script setup lang="ts">
import { useField } from 'vee-validate'
import * as yup from 'yup'

const toaster = inject('toaster') as any

const { errorMessage, value: email } = useField(
  '',
  yup.string().required().email(),
)

const {
  execute,
  pending: isLoading,
  data,
  error,
} = useLazyAsyncData(
  () =>
    $fetch(import.meta.env.VITE_APP_GOOGLE_SHEET_API_URL as string, {
      method: 'POST',
      mode: 'no-cors',
      body: {
        sheetName: 'home_contact_us',
        email: email.value,
      },
    }),
  {
    immediate: false,
  },
)

isLoading.value = false

const isDisabled = computed(() => !!errorMessage.value?.length)

const submit = () =>
  execute()
    .then(() => {
      if (!error.value) {
        toaster.success(`Successfully sent`)
      } else {
        toaster.error(`Error while sending`)
      }
    })
    .finally(() => {
      email.value = ''
    })
</script>

<template lang="pug">
footer.footer.footer-center(class='bg-[#00DC82] py-[50px] px-[30px]')
  .w-full.h-full.grid.gap-4(class='md:grid-flow-col')
    a.link.link-hover.text-white.text-lg(class='md:text-[28px]') FAQ
    a.link.link-hover.text-white.text-lg(class='md:text-[28px]') About
    a.link.link-hover.text-white.text-lg(class='md:text-[28px]') New Updates
    a.link.link-hover.text-white.text-lg(class='md:text-[28px]') Social & Community
</template>

<style lang="stylus" scoped></style>
