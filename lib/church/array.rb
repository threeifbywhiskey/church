module Church
  # Returns the size of an array or string.
  SIZE = -> coll {
    coll == [] || coll == '' ? 0 : 1 + SIZE[coll[1..-1]]
  }

  # Maps fn over coll.
  MAP = -> coll, &fn {
    coll == [] ? [] : [fn[coll[0]]] + MAP[coll[1..-1], &fn]
  }

  # Maps fn over coll in-place, modifying the original collection.
  MAP_BANG = -> coll, &fn {
    sz = SIZE[coll]
    i = 0

    (mapper = -> {
      coll[i] = fn[coll[i]]
      (i += 1) == sz ? coll : mapper[]
    })[]
  }

  # Reduces fn over coll.
  REDUCE = -> coll, &fn {
    sz = SIZE[coll]
    ret = coll[0]
    i = 1

    sz == 1 ? ret : (reducer = -> {
      ret = fn[ret, coll[i]]
      (i += 1) == sz ? ret : reducer[]
    })[]
  }

  # Filters coll through fn.
  FILTER = -> coll, &fn {
    coll == [] ? [] : (fn[coll[0]] ? [coll[0]] : []) + FILTER[coll[1..-1], &fn]
  }

  # Performs fn with each element of coll in turn.
  EACH = -> coll, &fn {
    sz = SIZE[coll]
    i = 0

    (eacher = -> {
      fn[coll[i]]
      (i += 1) == sz ? coll : eacher[]
    })[]
  }

  # Zips each element of coll with its index within the collection.
  INDEXED = -> coll {
    sz = SIZE[coll]
    ret = []
    i = 0

    (indexer = -> {
      ret << [coll[i], i]
      (i += 1) == sz ? ret : indexer[]
    })[]
  }

  # Reverses the collection.
  REVERSE = -> coll {
    sz = SIZE[coll]
    ret = coll[0, 0]
    i = sz

    (reverser = -> {
      ret << coll[i - 1]
      (i -= 1) == 0 ? ret : reverser[]
    })[]
  }

  # Sorts the collection.
  SORT = -> coll {
    x, *xs = *coll
    coll == [] ? []
    : SORT[FILTER[xs, &-> y { y  < x }]] + 
      [x] +
      SORT[FILTER[xs, &-> y { y >= x }]]
  }

  SORT_BY = -> coll, &fn {
    x, *xs = *coll
    coll == [] ? []
    : SORT_BY[FILTER[xs, &-> y { (fn[x] <=> fn[y]) == 1 }], &fn] + 
      [x] +
      SORT_BY[FILTER[xs, &-> y { (fn[x] <=> fn[y]) <= 0 }], &fn]
  }

  # Sorts the collection in reverse order.
  RSORT = COMPOSE[REVERSE, SORT]

  # Returns the collection with the first n elements dropped.
  DROP = -> coll, n { coll[n..-1] }

  # Returns the first n elements of the collection.
  TAKE = -> coll, n { coll[0, n] }
end
