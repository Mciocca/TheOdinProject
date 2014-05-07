multiples = []
(1...10).each do |num| 
  multiples << num if num % 3 == 0
  multiples << num if num % 5 == 0
end

puts multiples.inject(:+)