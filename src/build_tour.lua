local tour_distance = require 'tour_distance'

return function(cities, distances)
  local tour = { cities[1], cities[1] }

  for i = 2, #cities do
    local new_city = cities[i]
    local min = math.huge

    for insert_index = 2, #tour do
      local to = distances[tour[insert_index - 1]][new_city]
      local from = distances[new_city][tour[insert_index]]
      local old = distances[tour[insert_index - 1]][tour[insert_index]]
      local delta = to + from - old

      if delta < min then
        min = delta
        min_insert_index = insert_index
      end
    end

    table.insert(tour, min_insert_index, new_city)
  end

  tour[#tour] = nil
  return tour
end
