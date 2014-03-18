module Church
  # Returns the size of an array or string using recursion.
  SIZE = -> coll {
    coll == [] || coll == '' ? 0 : 1 + SIZE[coll[1..-1]]
  }

  # Returns the size of an array or string using iteration.
  ISIZE = -> coll {
    sz = 0
    (slicer = -> {
      sz += 1
      (coll = coll[1..-1]) == [] || coll == '' ? sz : slicer[]
    })[]
  }

  # Maps fn over coll recursively.
  MAP = -> coll, &fn {
    coll == [] ? [] : [fn[coll[0]]] + MAP[coll[1..-1], &fn]
  }

  # Maps fn over coll iteratively.
  IMAP = -> coll, &fn {
    sz = SIZE[coll]
    ret = []
    i = 0

    (mapper = -> {
      ret[i] = fn[coll[i]]
      (i += 1) == sz ? ret : mapper[]
    })[]
  }

  # Maps fn over coll iteratively and in-place, modifying the original collection.
  MAP_BANG = -> coll, &fn {
    sz = SIZE[coll]
    i = 0

    (mapper = -> {
      coll[i] = fn[coll[i]]
      (i += 1) == sz ? coll : mapper[]
    })[]
  }

  # Reduces fn over coll iteratively.
  REDUCE = -> coll, &fn {
    sz = SIZE[coll]
    ret = coll[0]
    i = 1

    sz == 1 ? ret : (reducer = -> {
      ret = fn[ret, coll[i]]
      (i += 1) == sz ? ret : reducer[]
    })[]
  }

  # Filters coll through fn using recursion.
  FILTER = -> coll, &fn {
    coll == [] ? [] : (fn[coll[0]] ? [coll[0]] : []) + FILTER[coll[1..-1], &fn]
  }

  # Filters coll through fn using iteration.
  IFILTER = -> coll, &fn {
    sz = SIZE[coll]
    ret = []
    i = 0

    (filterer = -> {
      fn[coll[i]] ? ret << coll[i] : 0
      (i += 1) == sz ? ret : filterer[]
    })[]
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

  # Sorts the collection in reverse order.
  RSORT = -> coll { REVERSE[SORT[coll]] }
end
