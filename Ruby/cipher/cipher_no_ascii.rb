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
      return translated.capitalize
    else
      return translated
    end
  end

  def translate_words(word,number)
    if word.split(' ').length == 1
      translate_single_word(word,number)
    else
      translate_multiple_words(word, number)
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
    translation = []
    letters = word.split('')
    letters.each {|letter| translation << translate_letter(letter, number) }
    translation = translation.join('') 
  end

  def make_alpha
    alphabet = []
    ('a'..'z').each {|letter| alphabet << letter}
    alphabet
  end
  
  def translate(word, number)
    if word.length == 1
      translation = translate_letter(word, number)
    else
      translation = translate_words(word, number)
    end
  end

end

cipher = Cipher.new

p cipher.translate('What a string!', 25)
