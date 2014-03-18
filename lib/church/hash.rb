module Church
  KEYS   = -> hash { MAP[[*hash], &:first] }

  VALUES = -> hash { MAP[[*hash], &:last]  }

  INVERT = -> hash {
    ks, vs = KEYS[hash], VALUES[hash]
    sz = SIZE[ks]
    ret = {}
    i = 0

    (inverter = -> {
      ret[vs[i]] = ks[i]
      (i += 1) == sz ? ret : inverter[]
    })[]
  }

  MERGE = -> a, b {
    all = [*a] + [*b]
    sz  = SIZE[all]
    ret = {}
    i = 0

    (merger = -> {
      ret[all[i][0]] = all[i][1]
      (i += 1) == sz ? ret : merger[]
    })[]
  }
end

include Church

p INVERT[{a: 1, b: 2, c: 3}]
