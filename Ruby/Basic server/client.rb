require 'socket'
require 'json'

host = 'localhost'
port = 2000

puts "What type of HTTP request would you like to send, GET or POST?"
method = gets.chomp
url = "/index.html"

if method == 'POST'
 puts "What is your name?"
 name = gets.chomp
 puts "What is your email?"
 email = gets.chomp
end

socket = TCPSocket.open(host,port)          


headers = "#{method} #{url} HTTP/1.1\n"
info = {:person => {:name => name, :email => email}}.to_json if method == "POST"

if method == "POST"
  headers = headers + "Content-Length: #{info.length}"
  socket.puts headers
  socket.puts info 
end
 
socket.puts headers if method == "GET"

puts socket.read

socket.close