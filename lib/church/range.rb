module Church
  # Returns an array containing the numbers from start to finish, inclusive, incremented by step
  RANGE = -> start, finish, step = 1 {
    (ranger = -> ret {
      start >= finish ? ret : ranger[ret << start += step]
    })[[start]]
  }
end
