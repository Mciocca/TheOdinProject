def echo(string)
  string
end

def shout(string)
  string.upcase
end

def repeat(string, num = 2)
 repeat = string
 (num-1).times { repeat = repeat + " " + string }
 return repeat
end

def start_of_word(string, num = 0)
  new_string = []
  (0...num).each {|x| new_string << string[x]}
  return new_string.join('')
end

def first_word(string)
  string = string.split(' ')
  return string[0]
end

def titleize(string)
  arr = string.split(' ').each { |word| word.capitalize! unless (word == "and" || word == "over" || word == "the") }
  arr[0].capitalize!
  return arr.join(' ')
end