module Church
  RANGE = -> start, finish, step = 1 {
    (ranger = -> ret {
      start >= finish ? ret : ranger[ret << start += step]
    })[[start]]
  }
end
