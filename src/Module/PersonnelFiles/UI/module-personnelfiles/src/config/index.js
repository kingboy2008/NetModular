const isDev = process.env.NODE_ENV !== 'production'

const config = {
  baseUrl: ''
}

// 开发模式
if (isDev) {
  config.baseUrl = 'http://localhost:6227/api/'
}
export default config
