def add(a, b)
  a+b
end

def subtract(a,b)
  a-b
end

def sum(array)
  return 0 if array.length == 0
  array.inject(:+)
end

def multiply(arr)
 arr.inject(:*) 
end

def power(num, power) 
  num ** power
end


def factorial(number)
  (1..number).inject(:*)
end