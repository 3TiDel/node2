> ./svelte.js
  @w5/vite-base
  path > join

< (dir)=>
  svelte(dir)
  conf = (await ViteBase(dir))()
  # for p from [
  #   '@8p/i18n'
  # ]
  #   conf.resolve.alias[p] = join(
  #     dir,'node_modules',p
  #   )
  # console.log conf.resolve
  conf
