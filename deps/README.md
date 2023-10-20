[‼️]: ✏️README.mdt

# @8n/deps

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @8n/deps
  @w5/uridir
  path > dirname

ROOT = dirname uridir(import.meta)

console.log deps ROOT
```

output :

```
[ '@w5/read', '@w5/uridir' ]
```
