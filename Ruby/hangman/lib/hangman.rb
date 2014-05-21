module Hangman

  class Player
    attr_accessor :guesses, :guessed_letters
    def initialize(guesses = 6, guessed_letters = [])
      @guesses = guesses
      @guessed_letters = guessed_letters
    end
     
    def draw_guesses
      case @guesses
      when 6
      puts '             _ _ _
            ||   | 
            ||   
            ||  
            ||  
            ||
            ========'
      when 5
      puts   '               _ _ _
              ||   |
              ||   O   
              ||  
              ||  
              ||
              ========'
      when 4
      puts "             _ _ _
            ||   |
            ||   O
            ||   |
            ||   
            ||
            ========"
      when 3
      puts "             _ _ _
            ||   |
            ||   O
            ||   |-
            ||   
            ||
            ========"
      when 2
      puts "             _ _ _
            ||   |
            ||   O
            ||  -|-
            ||   
            ||
            ========"
      when 1
      puts "             _ _ _
            ||   |
            ||   O
            ||  -|-
            ||  / 
            ||
            ========"
      when 0
      puts "             _ _ _
            ||   |
            ||   O
            ||  -|-
            ||  | |
            || 
            ========
            GAME OVER
            "
      else
        puts "You done broke it"
      end
    end

  end

  class Dictionary
    
    def self.filter_words(file)
      file.map {|line| line if line.length.between?(5,20)}
    end
    
    def self.generate_word
      words = File.open('./5desk.txt', 'r') { |f| filter_words(f) }
      words[rand(0..words.length)].downcase
    end

  end

  class Game
    require 'json'
    attr_reader :word, :hidden_word
    #word length should be between 5 and 20
    def initialize(word = nil, hidden_word = nil)
      @word = word.gsub("\n", "").split('') unless word == nil
      @hidden_word = hidden_word.split(' ') unless word == nil
      @word ||= Hangman::Dictionary.generate_word.gsub("\n", "").split('')
      @hidden_word ||= @word.map {|letter| letter = " _ "}
    end
  
    def play(player)
      puts "Type 'save!' at anytime to save your game"
      loop do
        puts "Guessed letters : " + player.guessed_letters.join(' ')
        print @hidden_word.join('')+"\n"
        guess = get_guess 
        save_game(player) if guess == "save!"
        check_guess(guess,player) unless guess == "save!"
        break if win? || loss?(player)
      end
    end

    def get_guess
      puts "Guess a letter"
      gets.chomp
    end

    def check_guess(guess, player)
      if @word.include?(guess)
        format_correct_guess(guess)
      else
        player.guesses -= 1
      end
        player.guessed_letters << guess
        player.draw_guesses
    end

    def win?
      if @word.join('') == @hidden_word.join('')
        puts @word.join('')
        puts "You win!"
        return true 
      end 
    end
   
    def loss?(player)
      if player.guesses == 0 
        puts "Word was : #{@word.join('')}"
        return true
      end
    end

    def format_correct_guess(guess)
      @word.each_with_index {|letter, index|  @hidden_word[index] = letter if letter == guess }
    end 

    def save_game(player)
      save_hash = {
        :guesses => player.guesses,
        :guessed_letters => player.guessed_letters,
        :word => @word.join(''),
        :hidden_word => @hidden_word.join(' ')
        }.to_json
      File.open('./saved.json', 'w') {|f| f.puts save_hash}
    end

    def self.load_game
      if File.exists?('./saved.json')  
        load = JSON.parse(File.read('./saved.json'))
        player = Hangman::Player.new(load['guesses'], load['guessed_letters'])
        game = Hangman::Game.new(load['word'], load['hidden_word'],)
        player.draw_guesses
        game.play(player)
      else
        Hangman::Game.new.play(Hangman::Player.new)
      end
    end
  #end game
  end

end
