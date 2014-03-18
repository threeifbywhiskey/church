module Church
  CHR = -> o { '' << o }

  ORD = -> c {
    (order = -> i {
      '' << i == c ? i : order[i + 1]
    })[1]
  }

  PRINT = -> obj { $> << obj }

  PUTS =  -> obj { $> << obj << "\n" }

  CHARS = -> str {
    sz = SIZE[str]
    ret = []
    i = 0

    (chars_p = -> {
      ret << str[i]
      (i += 1) == sz ? ret : chars_p[]
    })[]
  }

  JOIN = -> str, delim { str * delim }
end
