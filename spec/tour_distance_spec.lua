describe('tour_distance', function()
  local tour_distance = require 'tour_distance'

  local distances = {
    a = { a = 0, b = 2, c = 5 },
    b = { a = 2, b = 0, c = 3 },
    c = { a = 5, b = 4, c = 0 },
  }

  it('should correctly calculate the distance of single city tours', function()
    assert.equal(0, tour_distance({ 'a' }, distances))
    assert.equal(0, tour_distance({ 'b' }, distances))
    assert.equal(0, tour_distance({ 'c' }, distances))
  end)

  it('should correctly calculate the distance of multiple city tours', function()
    assert.equal(4, tour_distance({ 'a', 'b' }, distances))
    assert.equal(10, tour_distance({ 'a', 'c' }, distances))
    assert.equal(11, tour_distance({ 'c', 'b', 'a' }, distances))
  end)
end)
