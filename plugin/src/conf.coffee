#!/usr/bin/env coffee

> @w5/uridir
  path > dirname

export ROOT = dirname uridir(import.meta)
