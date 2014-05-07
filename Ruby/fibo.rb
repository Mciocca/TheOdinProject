old_num = 0
new_num = 1
result  = 0
even = []

while result <= 4000000
  result = old_num + new_num  
  even << result if result % 2 == 0
  old_num  = new_num
  new_num  = result
end

print even
puts "\n" + even.inject(:+).to_s