return function(tour, distances)
  local distance = distances[tour[1]][tour[#tour]]
  for i = 1, #tour - 1 do
    distance = distance + distances[tour[i]][tour[i + 1]]
  end
  return distance
end
