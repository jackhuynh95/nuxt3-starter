import { useGet } from './axios'

export function getList(params = {}) {
  return useGet({
    url: '/rest/collections/programs',
    params,
  })
}

export function getDetail(id: string) {
  return useGet({
    url: `/rest/collections/programs/${id}`,
  })
}
