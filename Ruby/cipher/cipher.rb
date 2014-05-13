class Cipher

 def cipher(string,shift)
  trans = []
  string.each_byte do |byte|
    if byte.between?(65, 90)
      trans << (byte+shift-65) % 26 + 65
    elsif byte.between?(97,122)
      trans << (byte+shift-97) % 26 + 97
    else
      trans << byte
    end
  end
  trans
 end

  def translate(string, shift)
    cipher(string, shift).map {|char| char.chr }.join('')
  end
  
end

cipher = Cipher.new

puts cipher.translate("What a string!", 5)
##loop does not play well with rspec. comment out loop do, break,and loop end when running tests
loop do
  puts "\nType 'quit!' to exit program" 
  puts "Give me a string to translate!"
  string = gets.chomp
  break if string == 'quit!'

  puts "Give me a number to offset by!"
  num = gets.chomp.to_i

  puts "Result : "+cipher.translate(string, num)
end

