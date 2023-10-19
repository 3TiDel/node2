#!/usr/bin/env coffee

> ./conf > ROOT
  @8n/lang/NOSPACE.js
  fs > readdirSync rmSync existsSync
  path > join
  ./NodeModules:@ > node_modules
  @8n/nt/load.js
  @w5/write
  @w5/utf8/utf8e.js
  @8n/urle
  @8n/i18n
  @w5/u8 > u8eq
  @8n/lang:LANG
  @w5/xxhash3-wasm > hash128
  json5
#   @w5/utf8/utf8d.js
#
# decode = (bin)=>
#   li = []
#   start = 0
#   for i,p in bin
#     if i == 0
#       li.push utf8d bin.subarray start, p
#       start = p + 1
#   return li

replace = (lang, v)=>
  v.replace(
    /(\s)?<br\s+([^\/>]+)>(\s)?/g
    (_,pre,s,after)=>
      if NOSPACE.has lang
        pre = after = ''
      else
        pre = after = ' '
      pre+'${'+s+'}'+after
  ).trim()

I18N = join ROOT,'i18n'
SRC = join ROOT,'src'
PUBLIC_I18N = join ROOT, 'public/i18n'
rmSync(PUBLIC_I18N, { recursive: true, force: true })

merge = (li)=>
  totalLength = li.reduce(
    (acc, arr) => acc + arr.length
    0
  ) + li.length - 1

  mergedArray = new Uint8Array(totalLength)

  currentIndex = 0

  for arr, index in li
    mergedArray.set(arr, currentIndex)

    currentIndex += arr.length

    if index isnt li.length - 1
      mergedArray[currentIndex++] = 0

  return mergedArray

export default main = =>
  console.log '\n# i18n\n'
  await i18n I18N
  + keys

  lang_fp = []
  lang_li = []

  for [lang, lang_name] from LANG
    fp = join(I18N,lang,'i18n.nt')
    if not existsSync fp
      continue
    o = load fp
    not_keys = not keys
    for i from NodeModules
      nfp = join(node_modules, i, 'i18n',lang,'i18n.nt')
      if existsSync nfp
        t = load nfp
        if not_keys
          console.log i+':', Object.keys(t).join(' ')
        o = {
          ...t
          ...o
        }

    if not_keys
      keys = Object.keys(o)
      keys.sort()
      console.log ''

    r = []
    for i from keys
      v = replace lang, o[i]
      if not_keys
        console.log i + ':', v
      r.push utf8e v
    r = merge r
    # console.log decode r
    name = urle hash128 r
    lang_fp.push name
    lang_li.push([lang,lang_name])
    write(
      join PUBLIC_I18N, name
      r
    )

  write(
    join(
      SRC, 'lib/LANG.js'
    )
    [
      'export default '+ JSON.stringify(lang_li, null, 2)
      'export const HASH = '+ JSON.stringify(lang_fp, null, 2)
    ].concat(
      keys.map(
        (i,p)=>"export const $#{i}=#{p}"
      )
    ).join('\n')
  )
  return


if process.argv[1] == decodeURI (new URL(import.meta.url)).pathname
  await main()
