describe('csv_to_distances', function()
  local csv_to_distances = require 'csv_to_distances'

  it('should generate a table of distances', function()
    local distances = csv_to_distances([[
,"city1","city2","city3",
"city1",0,12,13,
"city2",12,0,23,
"city3",13,23,0,
]])

    assert.equal(0, distances['city1']['city1'])
    assert.equal(12, distances['city1']['city2'])
    assert.equal(13, distances['city1']['city3'])
    assert.equal(12, distances['city2']['city1'])
    assert.equal(0, distances['city2']['city2'])
    assert.equal(23, distances['city2']['city3'])
    assert.equal(13, distances['city3']['city1'])
    assert.equal(23, distances['city3']['city2'])
    assert.equal(0, distances['city3']['city3'])
  end)
end)
