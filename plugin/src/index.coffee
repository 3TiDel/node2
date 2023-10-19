#!/usr/bin/env coffee

> ./i18n.js
  ./styl.js

export default main = =>
  styl()
  await i18n()
  return

if process.argv[1] == decodeURI (new URL(import.meta.url)).pathname
  await main()
  process.exit()
