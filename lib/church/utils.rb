module Church::Utils
  # Returns the ROT-13 of the specified character
  ROT13 = -> chr {
    ord = ORD[chr]
    ord > 64 && ord <  91 ? CHR[(ord -  78) % 26 + 65] :
    ord > 96 && ord < 123 ? CHR[(ord - 110) % 26 + 97] : chr
  }

  # Returns its argument's Collatz sequence as an array
  COLLATZ = -> n {
    (collatz_p = -> cs {
      n = n % 2 == 0 ? n / 2 : n * 3 + 1
      n == 1 ? cs << 1 : collatz_p[cs << n]
    })[[n]]
  }

  DIGITSUM = -> n {
    (summer = -> sum {
      (n /= 10) == 0 ? sum : summer[sum + n % 10]
    })[n % 10]
  }
end
