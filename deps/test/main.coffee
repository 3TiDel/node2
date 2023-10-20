#!/usr/bin/env coffee

> @8n/deps
  @w5/uridir
  path > dirname

ROOT = dirname uridir(import.meta)

console.log deps ROOT
