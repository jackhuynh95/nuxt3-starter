import axios from 'axios'
import { useAxios } from '@vueuse/integrations/useAxios'

const instance = axios.create({
  baseURL: import.meta.env.VITE_APP_BASE_API_URL || window.location.origin,
  // withCredentials: true,
})

instance.interceptors.request.use((config) => {
  // if (config && config.url) {
  //   config.headers['X-Requested-With'] = 'XMLHttpRequest'
  // }

  return config
})

instance.interceptors.response.use(
  (response) => {
    return response
  },
  (error) => {
    // if (error.response) {
    //   console.log(error.response.status.toString(), error)
    // }

    return Promise.reject(error)
  },
)

export default instance

export const useGet = ({
  url = '',
  params = {},
} = {}) => {
  const usedAxios = useAxios(
    url,
    { method: 'GET', params },
    instance,
    {
      immediate: false,
    },
  )

  return usedAxios
}
export const usePost = ({
  url = '',
  data = {},
} = {}) => {
  const usedAxios = useAxios(url, { method: 'POST', data }, instance, {
    immediate: false,
  })

  return usedAxios
}
