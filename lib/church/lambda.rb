module Church
  COMPOSE = -> f, g { -> x { f[g[x]] } }
end
