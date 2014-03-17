module Church
  CMP = -> a, b {
    a > b ? 1 : a < b ? -1 : 0
  }

  ADD = -> a, b {
    b == 0 ? a : ADD[a + CMP[b, 0], b + CMP[0, b]]
  }

  SUB = -> a, b {
    b == 0 ? a : SUB[a + (0 <=> b), b + (0 <=> b)]
  }

  MUL = -> a, b {
    (mul_p = -> c, d {
      d == b ? c + a * CMP[0, b] : mul_p[c + a * CMP[b, 0], d + CMP[b, 0]]
    })[a * CMP[b, 0], 0]
  }

  DIV = -> a, b {
    div_p = -> d {
      d = ADD[d, CMP[b, 0]]
      a = SUB[a, MUL[b, CMP[b, 0]]]
      a >= MUL[b, CMP[b, 0]] ? div_p[d] : d
    }
    b > a ? 0 : div_p[0]
  }

  MOD = -> a, b {
    MOD_p = -> {
      a = SUB[a, MUL[b, CMP[b, 0]]]
      a > b ? MOD_p[] : (b < 0 ? SUB[a, b] : a)
    }
    MOD_p[]
  }

  POW = -> a, b {
    (POW_p = -> c, d {
      d == b ? c : POW_p[MUL[a, c], ADD[d, 1]]
    })[1, 0]
  }
end
