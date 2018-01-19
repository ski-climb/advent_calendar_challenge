
test_1 = 1     #=> 0
test_2 = 12    #=> 3
test_3 = 23    #=> 2
test_4 = 1024  #=> 31
final = 289326 #=> 419

def spiral(input)
  if input == 1
    result = 0
  else
    rings = (0..300).to_a
    ring = rings.find do |n|
      input > (2*(n - 1) + 1)**2 && input < (2*n + 1)**2
    end

    ring = ring.as(Int32)
    length_of_side = ((2*ring + 1)**2 - (2*(ring - 1) + 1)**2) / 4
    ring_square = (2*ring + 1)**2

    midpoints = [] of Int32
    4.times { |n| midpoints << ring_square - length_of_side / 2 - n * length_of_side }

    addition = midpoints.map do |midpoint|
      (input - midpoint).abs
    end.min

    result = ring + addition
  end

  result
end


puts "test_1: #{spiral(test_1)}"
puts "test_2: #{spiral(test_2)}"
puts "test_3: #{spiral(test_3)}"
puts "test_4: #{spiral(test_4)}"
puts "final: #{spiral(final)}"
