module Church
  CHR = -> o { '' << o }

  ORD = -> c {
    (order = -> i {
      '' << i == c ? i : order[i + 1]
    })[1]
  }

  PRINT = -> obj { $> << obj }

  PUTS =  -> obj { $> << obj << "\n" }
end
