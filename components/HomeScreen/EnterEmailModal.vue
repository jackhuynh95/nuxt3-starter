<script setup lang="ts">
import { ModalBase, ModalTitle, ModalBody, ModalAction } from 'daisyui-vue'
import { useField } from 'vee-validate'
import * as yup from 'yup'

const props = defineProps({
  visible: {
    type: Boolean,
    default: false,
  },
})

const emits = defineEmits(['update:visible'])

const close = () => emits('update:visible', !props.visible)

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

      close()
    })
    .finally(() => {
      email.value = ''
    })
</script>

<template lang="pug">
ModalBase(:open='visible' :onClose='close')
  //- ModalTitle

  ModalBody.bg-black.text-center(class='space-y-[30px] p-[30px]')
    .flex.justify-end
      button.btn.btn-neural.btn-circle(@click='close')
        Icon.bg-transparent.text-3xl.text-white(name='mdi:close-thick')

    .font-bold.text-white.text-xl
      div The Intuitive Vue
      div Framework

    div(class='space-y-[30px]')
      form.space-y-2(@submit.prevent='submit')
        input.input.input-bordered.w-full(
          v-model='email'
          type='text'
          placeholder='Email address'
        )

        // Error Message
        .text-sm.text-red-400(class='transition-[height]') {{ errorMessage }}

        // Submit Button
        button.hidden(type='submit' :disabled='isDisabled')

      div
        button.btn.btn-secondary.w-full(
          :class='{ loading: isLoading, "pointer-events-none opacity-60": isDisabled }'
          @click='submit'
        )
          | Register Now

    .font-bold.text-xs(class='text-[#C0C0C0]') 
      div Build your next Vue.js application with confidence using Nuxt.
      div An open source framework making web development simple and powerful.

  //- ModalAction
</template>

<style lang="stylus" scoped></style>
