import module from '../module'

let apis = {}
const requireComponent = require.context('./components', true, /\.*\.js$/)
requireComponent.keys().map(fileName => {
  const name = fileName.replace('./', '').replace('.js', '')
  const func = requireComponent(fileName).default
  apis[name] = func(name)
})

$api[module.code] = apis
