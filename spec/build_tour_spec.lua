describe('build_tour', function()
  local build_tour = require 'build_tour'

  local distances = {
    a = { a = 0, b = 2, c = 5, d = 1 },
    b = { a = 2, b = 0, c = 3, d = 2 },
    c = { a = 5, b = 4, c = 0, d = 5 },
    d = { a = 1, b = 2, c = 5, d = 0 },
  }

  it('should build a tour with only a single city', function()
    assert.same({ 'a' }, build_tour({ 'a' }, distances))
  end)

  it('should build a tour with two cities', function()
    assert.same({ 'a', 'b' }, build_tour({ 'a', 'b' }, distances))
  end)

  it('should build tours with more cities by inserting the next city optimally', function()
    assert.same({ 'a', 'b', 'c' }, build_tour({ 'a', 'b', 'c' }, distances))
    assert.same({ 'a', 'd', 'b', 'c' }, build_tour({ 'a', 'b', 'c', 'd' }, distances))
  end)
end)
