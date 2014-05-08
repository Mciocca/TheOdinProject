require './cipher.rb'

describe Cipher do
  
  before do
    @cipher = Cipher.new
  end

  describe " as single letter" do
    it "should cipher by 3" do
      translation = @cipher.translate('a', 3)
      translation.should == 'd'
    end
  end

  describe "A single word" do
    it "should be ciphered" do
      @cipher.translate('hello', 3).should == "khoor"
    end
  end

  describe "Multiple words" do
    it "should be ciphered" do
      @cipher.translate('what a string', 5).should == "bmfy f xywnsl"
    end
  end

  describe " should save case" do
    it "while translating" do
     @cipher.translate('What a string', 5).should == "Bmfy f xywnsl"
    end
  end

  describe "should save punctuation" do
    it "while translating" do
      @cipher.translate('What a string!', 5).should == "Bmfy f xywnsl!"
    end
  end

end