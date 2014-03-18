module Church
  # Returns the keys of a Hash as an array
  KEYS   = -> hash { MAP[[*hash], &:first] }

  # Returns the values of a Hash as an array
  VALUES = -> hash { MAP[[*hash], &:last]  }

  # Inverts the keys and values of its hash argument
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

  # Merges the keys and values of the two hashes into a new hash
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
