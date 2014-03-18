module Church::Utils
  # Returns the ROT-13 of the specified character
  ROT13 = -> chr {
    ord = ORD[chr]
    ord > 64 && ord <  91 ? CHR[(ord -  78) % 26 + 65] :
    ord > 96 && ord < 123 ? CHR[(ord - 110) % 26 + 97] : chr
  }

  COLLATZ = -> n {
    c = [n]
    (collatz_p = -> {
      n = n % 2 == 0 ? n / 2 : n * 3 + 1
      c << n
      n == 1 ? c : collatz_p[]
    })[]
  }
end
