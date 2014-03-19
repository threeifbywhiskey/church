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

    (mapper = -> i {
      coll[i] = fn[coll[i]]
      (i += 1) == sz ? coll : mapper[i]
    })[0]
  }

  # Reduces fn over coll.
  REDUCE = -> coll, &fn {
    sz = SIZE[coll]
    ret = coll[0]

    sz == 1 ? ret : (reducer = -> i {
      ret = fn[ret, coll[i]]
      (i += 1) == sz ? ret : reducer[i]
    })[1]
  }

  # Filters coll through fn.
  FILTER = -> coll, &fn {
    coll == [] ? [] : (fn[coll[0]] ? [coll[0]] : []) + FILTER[coll[1..-1], &fn]
  }

  # Performs fn with each element of coll in turn.
  EACH = -> coll, &fn {
    sz = SIZE[coll]

    (eacher = -> i {
      fn[coll[i]]
      (i += 1) == sz ? coll : eacher[i]
    })[0]
  }

  # Zips each element of coll with its index within the collection.
  INDEXED = -> coll {
    sz = SIZE[coll]

    (indexer = -> ret, i {
      ret << [coll[i], i]
      (i += 1) == sz ? ret : indexer[ret, i]
    })[[], 0]
  }

  # Reverses the collection.
  REVERSE = -> coll {
    sz = SIZE[coll]

    (reverser = -> ret, i {
      ret << coll[i - 1]
      (i -= 1) == 0 ? ret : reverser[ret, i]
    })[coll[0, 0], sz]
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

  # Returns the collection's minimum.
  MIN = -> coll { SORT[coll][ 0] }

  # Returns the collection's maximum.
  MAX = -> coll { SORT[coll][-1] }

  # Returns the collection with the first n elements dropped.
  DROP = -> coll, n { coll[n..-1] }

  # Returns the first n elements of the collection.
  TAKE = -> coll, n { coll[0, n] }

  # Returns the index of the element within the collection, or nil if not found.
  INDEX = -> coll, elem {
    (indexer = -> i {
      coll[i] == elem ? i : i > SIZE[coll] ? nil : indexer[i + 1]
    })[0]
  }
end
