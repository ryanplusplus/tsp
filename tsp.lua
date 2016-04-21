package.path = 'src/?.lua;' .. package.path

local build_tour = require 'src/build_tour'
local csv_to_distances = require 'src/csv_to_distances'
local read_file = require 'src/read_file'
local shuffle = require 'src/shuffle'
local tour_distance = require 'src/tour_distance'

local distances = csv_to_distances(read_file(arg[1]))
local cities = {}
for city in pairs(distances) do
  table.insert(cities, city)
end

local tours = {}

for i = 1, tonumber(arg[2]) or 10 do
  shuffle(cities)
  table.insert(tours, build_tour(cities, distances))
end

table.sort(tours, function(a, b)
  return tour_distance(a, distances) < tour_distance(b, distances)
end)

print('Tour:')
print(' - ' .. table.concat(tours[1], '\n - '))
print()
print('Distance: ' .. tour_distance(tours[1], distances))
