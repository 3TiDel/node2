> base-x

BFILE = BaseX '!$-.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz'

export default (bin)=>
  BFILE.encode bin
