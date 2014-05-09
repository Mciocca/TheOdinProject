require './substring.rb'

describe String do
  
  before do
    @dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
    @hash = substrings("Howdy partner, sit down! How's it going?", @dictionary)
  end

  describe '#substrings' do
    subject {@hash}
    it {should be_kind_of Hash}
    it {should_not be_empty}
  end

end