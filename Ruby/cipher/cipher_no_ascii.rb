##cipher the hard/dumb way!
class Cipher

  def translate_letter(letter, number)
    alpha = make_alpha
    index = alpha.find_index(letter.downcase)
    #returns punctuation
    return letter if index == nil
    if index+number > 25
      #wrap back to the beginning of the array, take in account of 0 index
      changed = alpha[((index+number)-26)%26]
    else
      changed = alpha[(index+number)]
    end
    original_case(letter,changed)
  end

  def original_case(old, translated)
    if old == old.capitalize
      translated.capitalize
    else
      translated
    end
  end

  def translate_multiple_words(words,number)
    words = words.split(' ')
    translation = []
    words.each do |word|
      temp = []
      word.split('').each do |l|
        temp << translate_letter(l,number)
      end
      translation << temp.join('') 
    end
    translation.join(' ')
  end

  def translate_single_word(word, number)
    letters = word.split('')
    translation = letters.map {|letter| translate_letter(letter, number) }
    translation.join('') 
  end

  def make_alpha
    ('a'..'z').map {|letter| letter}
  end
  
  def translate(word, number)
    if word.split(' ').length == 1
      translate_single_word(word,number)
    else
      translate_multiple_words(word, number)
    end
  end

end

cipher = Cipher.new

p cipher.translate('What a string!', 5)


