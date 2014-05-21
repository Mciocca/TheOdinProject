require 'net/http'
require 'nokogiri'
require 'net/smtp'

def get_web_document(url)
  uri = URI.parse(url)
  response = Net::HTTP.get_response(uri)
  case response
  when Net::HTTPSuccess
    return response.body
  when Net::HTTPRedirection
    return get_web_document(response['Location'])
  else
    return nil
   end
end
puts get_web_document('http://www.rubyinside.com/test.txt')
puts get_web_document('http://www.rubyinside.com/non-existent').to_s
puts get_web_document('http://www.rubyinside.com/redirect-test')


url = URI.parse('http://www.rubyinside.com/test.cgi')
response = Net::HTTP.post_form(url,{'name' => 'David', 'age' => '24'})
puts response.body
