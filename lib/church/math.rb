module Church
  # Returns the square root of its argument
  SQRT = -> n { n ** 2 ** -1 }

  # Returns its argument rounded down
  FLOOR = -> n { n - n % 1 }

  # Returns the primality of its argument
  PRIME = -> n {
    n = n < 0 ? -n : n
    n < 3 ? n == 2 : n % 2 == 0 ? false :
    REDUCE[[1] + MAP[[*3..FLOOR[SQRT[n]]], &-> m { n % m }], &:*] > 0
  }
end
