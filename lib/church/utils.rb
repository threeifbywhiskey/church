module Church::Utils
  ROT13 = -> chr {
    ord = ORD[chr]
    ord > 64 && ord <  91 ? CHR[(ord -  78) % 26 + 65] :
    ord > 96 && ord < 123 ? CHR[(ord - 110) % 26 + 97] : chr
  }
end
