module Church
  # Returns the equivalent of Fixnum#chr
  CHR = -> o { '' << o }

  # Returns the equivalent of String#ord
  ORD = -> c {
    (order = -> i {
      '' << i == c ? i : order[i + 1]
    })[1]
  }

  # Prints the object
  PRINT = -> obj { $> << obj }

  # Prints the object with a newline
  PUTS =  -> obj { $> << obj << "\n" }

  # Returns an array of the characters of a string
  CHARS = -> str {
    sz = SIZE[str]
    ret = []
    i = 0

    (chars_p = -> {
      ret << str[i]
      (i += 1) == sz ? ret : chars_p[]
    })[]
  }

  # Joins the collection into a string on a specified delimiter
  JOIN = -> coll, delim { coll * delim }

  # Converts its string argument to a number
  TO_I = -> str {
    (to_i = -> i {
      i = i * 10 + ORD[str[0]] - ORD['0']
      (str = str[1..-1]) == '' ? i : to_i[i]
    })[0]
  }
end
