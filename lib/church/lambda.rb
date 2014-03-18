module Church
  # Composes the lambdas f and g into a procedure which returns f(g(x))
  COMPOSE = -> f, g { -> x { f[g[x]] } }
end
