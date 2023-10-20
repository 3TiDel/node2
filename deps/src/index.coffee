#!/usr/bin/env coffee

> path > join
  @w5/read

< (root)=>
  {
    devDependencies
    dependencies
  } = JSON.parse read(
    join root,'package.json'
  )
  for pkg from [
    dependencies
    devDependencies
  ]
    if pkg
      node_modules.push ... Object.keys(pkg)
  node_modules
