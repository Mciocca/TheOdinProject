module Enumerable
  
  def my_each
    for i in self
      yield(i)
    end
  end

  def my_each_with_index
    i = 0
    while i < self.count
      yield(self[i], i )
      i += 1
    end
  end

  def my_select
    self.my_each {|num| yield(num) }
  end

  def my_all?
    flag = true
    self.my_each {|e| flag = false if yield(e) == false}
    flag
  end

  def my_any?
    flag = false
    self.my_each {|e| flag = true if yield(e) == true}
    flag
  end

  def my_none?
    flag = true
    self.my_each {|e| flag = false if yield(e) == true}
    flag
  end

  def my_count(val = nil)
   i = 0
    if val == nil && !block_given? 
      self.my_each { i += 1}
    elsif val == nil && block_given? 
      self.my_each {|e| i += 1 if yield(e) == true}
    else
      self.my_each {|e| i+= 1 if val == e}
    end
    i
  end
  # Odin project map method takes a proc or a proc and a block
  def my_map(p = nil)
    if p.class == Proc
      arr = []
      self.my_each {|e| arr.push(p.call(e)) } unless p == nil
      if p !=nil and block_given?
        self.my_each {|e| arr.push(yield(e)) }
      end
      arr
    end
  end

  def my_inject(num = nil)
    memo = 0
    if num != nil
      memo = num
      self.my_each {|e| memo = yield(memo, e)}
    else
      self.my_each {|e| memo = yield(memo, e)}
    end
    memo
  end
end

puts "\n#my_each"
[1,2,3,90].my_each {|num| puts num}

puts "\n#my_each_with_index"
[1,2,3,90].my_each_with_index { |num, index| puts num.to_s+" => "+index.to_s}

puts "\n#my_select"
[1,2,3,4].my_select {|num| puts num if num.even?}

puts "\n#my_all"
puts %w[ant bear cat].my_all? { |word| word.length >= 3 }
puts %w[ant bear at couch].my_all? { |word| word == 'couch' }
puts %w[couch couch ].my_all? { |word| word == 'couch' }

puts "\n#my_any"
puts %w[ant bear cat].my_any? { |word| word.length >= 4 }
puts %w[ant bear cat].my_any? { |word| word.length == 0 }

puts "\n#my_none"
puts %w{ant bear cat}.none? { |word| word.length == 5 } #=> true
puts %w{ant bear cat}.none? { |word| word.length >= 4 } #=> false

puts "\n#mycount"
ary = [1, 2, 4, 2, 2]
puts ary.my_count
puts ary.my_count{ |x| x%2==0 }
puts ary.my_count(2)

puts "\n#my_map"
multiply = Proc.new { |i| i*i } 
print (1..4).my_map(multiply)
print (1..4).my_map {"tacos"}

puts "\n#my_inject"
puts (5..10).my_inject { |sum, n| sum + n }
puts (5..10).my_inject(1) { |product, n| product * n }

  def multiple_els(array)
    return array.my_inject(1) {|product, n| product * n}
  end

puts multiple_els([2,4,5]) #=> 40