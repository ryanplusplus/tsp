return function(t)
  local shuffled = {}
  for i, v in ipairs(t) do
    shuffled[i] = v
  end

  for i = 1, #t do
    local a, b = math.random(#t), math.random(#t)
    t[a], t[b] = t[b], t[a]
  end

  return shuffled
end
