require('./lib/hangman.rb')

puts 'Type \'load\' to load the last game you played, or \'new\' to start a new game'
answer = gets.chomp
if answer == 'load'
  Hangman::Game.load_game
else
  Hangman::Game.new.play(Hangman::Player.new)
end