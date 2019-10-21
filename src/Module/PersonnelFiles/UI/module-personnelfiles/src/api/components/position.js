import module from '../../module'

export default name => {
  const root = `${module.code}/${name}/`
  const crud = $http.crud(root)
  const urls = {
    select: root + 'Select'
  }

  const select = departmentId => {
    return $http.get(urls.select, { departmentId })
  }

  return {
    ...crud,
    select
  }
}
