require './lib/hangman.rb'

describe Hangman::Dictionary do
  it "should return a word between 5-20 characters" do
    10.times { Hangman::Dictionary.generate_word.length.should be_between(5,20) }
  end
end

describe Hangman::Player do

  before do
    @player = Hangman::Player.new 
  end
  
  it "should have 6 guesses" do
    @player.guesses.should == 6
  end
 
  it "should have a guessed letters array" do
    @player.guessed_letters.class.should == Array
  end
end
