require '../spec/spec_helper.rb'
require '../lib/zombie.rb'

describe Zombie do
  it "is named Ash" do
    zombie = Zombie.new('Ash')
    zombie.name.should == 'Ash'
  end
  
  it "has no brains" do
    zombie = Zombie.new('Ash')
    zombie.brains.should < 1
  end

  it "isnt alive" do
    zombie = Zombie.new('Ash')
    zombie.alive.should == false
  end
  
  it "is hungry" do
    zombie = Zombie.new('Ash')
    zombie.hungry = false
    zombie.should_not be_hungry
  end 

end