def translate(string)
  if string.split(' ').size < 2
    string.format
  else
    string.translate_multiple_words
  end  
end

public
## methods that match rules
def has_vowel_first?
  self[0].is_vowel?
end

def is_vowel?
  self.match(/[aeiou]/)
end

def match_qu?
  letters = self[0] + self[1]
  letters == 'qu'
end

def format
  arr = self.split('')
   arr.size.times do
    if !arr[0].is_vowel? || arr[0] == 'u'
      arr << arr[0]
      arr.shift
    else
      break
    end
  end 
  arr.join('') + 'ay'
end

def translate_multiple_words
  words = []
  arr = self.split(' ').each { |word| words << translate(word) }
  words.join(' ')
end