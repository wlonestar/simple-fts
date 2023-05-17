import { useEffect } from 'react'
import axios from 'axios'

const baseURL: string = 'http://localhost:8088'

export const client = axios.create({
  baseURL: baseURL,
  timeout: 5000
})

export const useMount = (callback: () => void) => {
  useEffect(() => {
    callback()
  }, [])
}
