dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(phrase, dictionary)
  count = Hash.new(0)
  phrase = phrase.split(' ')
   dictionary.each do |dict|
     phrase.each { |word| count[word.downcase.scan(dict).join('')] += 1 unless word.downcase.scan(dict).join('') == "" } 
   end
  count
end

puts substrings("Howdy partner, sit down! How's it going?", dictionary)