local function lines(s)
  local lines = {}
  local i = 1
  for line in s:gmatch('[^\n]+') do
    table.insert(lines, line)
  end
  return lines
end

return function(csv)
  local lines = lines(csv)
  local cities = {}
  local distances = {}

  for city in lines[1]:gmatch('"([^"]+)"') do
    table.insert(cities, city)
  end

  for i = 2, #lines do
    local from = cities[i - 1]
    distances[from] = {}
    local j = 1

    for distance in lines[i]:gmatch(',(%d+)') do
      local to = cities[j]
      distances[from][to] = tonumber(distance)
      j = j + 1
    end
  end

  return distances
end
