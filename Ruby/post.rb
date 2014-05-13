class Post
  attr_reader :title, :body, :comment

 def initialize(title,body,comment)
   @title = title
   @body = body
   @comment = comment
 end

 def body_word_length_avg(body)
   words = body.split(' ')
   words.inject {|count, word| count += word.split('').count } / words.count
 end

 def word_total
  self.title.length + self.body.length + self.comment.length
 end

end