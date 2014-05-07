class Book 
  attr_accessor :title

  def title
    @title
  end

  def title=(title)
    if title.split(' ').size == 1  
      @title = title.capitalize
    else
      @title = title.capitalize_multiple
    end
  end

end

class String
 
  def capitalize_multiple
    words = []
    arr = self.split(' ')
    arr.each {|word| word.capitalize! unless word.match_restrictions? }
    arr[0].capitalize!
    arr.join(' ')
  end

  def match_restrictions?
    restrictions = ["and", "nor", "but", "or", "yet", "so","in", "the", "of", "a", "an"]
    restrictions.each do |res|
      if self == res
        return true
        break
      end
    end
    return false
  end

  
end