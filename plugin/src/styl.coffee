#!/usr/bin/env coffee

> @w5/write
  fs > existsSync
  path > join
  ./conf.js > ROOT
  ./NodeModules.js:@ > node_modules

export default =>
  STYL = []

  for i from NodeModules
    fp = join(i,'index.styl')
    if existsSync join(node_modules, fp)
      STYL.push "@import '#{fp}'"

  STYL = STYL.join '\n'
  console.log '\n# styl\n'

  console.log STYL
  write(
    join ROOT,'src/styl/plugin.styl'
    STYL
  )
  return

