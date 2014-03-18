module Church
  SQRT = -> n { n ** 2 ** -1 }

  FLOOR = -> n { n - n % 1 }

  PRIME = -> n {
    n = n < 0 ? -n : n
    n < 3 ? n == 2 : n % 2 == 0 ? false :
    REDUCE[[1] + MAP[[*3..FLOOR[SQRT[n]]], &-> m { n % m }], &:*] > 0
  }
end
