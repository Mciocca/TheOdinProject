def prime_number?(num)
  (2...num).each do |x|
    return false if num % x === 0  
  end 
end

def find_highest(max)
  highest = 0
  factors = []
  (2..max).each do |num|
    if max % num == 0
      factors << num if prime_number?(num)
    end
  end
  return factors.inject(0) { |old, current | highest = current if current > old  }
end

puts 'Which number would you like to find the highest prime factor of?'
num = gets.chomp

puts "\nHighest Prime Factor: " + find_highest(num.to_i).to_s