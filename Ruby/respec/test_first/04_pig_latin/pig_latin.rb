def translate(string)
  if string.split(' ').size < 2
    if string.has_vowel_first?
      string + 'ay'
    else
      string.format_consonant_first
    end
  else
    string.translate_multiple_words
  end  
end

public
## methods that match rules
def has_vowel_first?
  if self[0].match(/[aeiou]/)
    return true
  else
    return false
  end
end

def is_vowel?
  if self.match(/[aeiou]/)
    return true
  else
    return false
  end
end

def match_qu?
  letters = self[0] + self[1]
  if letters == 'qu'
    return true
  end
  return false
end

def format_consonant_first
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