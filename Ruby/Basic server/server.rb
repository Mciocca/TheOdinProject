require 'socket' 
require 'json'


server = TCPServer.new('127.0.0.1', 2000)
puts 'server started on port 2000'

loop {       

  Thread.new(server.accept) do |client|
   req = client.read_nonblock(512).chomp.split("\n")
   method = req[0].split(' ')[0]
   location = req[0].split(' ')[1]
   puts "\n\n#{method} connection accepted\nRequest => #{req}"

   if method == 'GET' && location == '/index.html' || location == '/' 
     body = (File.read('index.html'))
     headers = "HTTP/1.0 200 OK\nDate: #{Time.now}\nContent-Type: #{File.extname('index.html')}\nContent-Length: #{body.size}\n\n "
     client.puts headers + body
   end

   if location == '/style.css'
     client.puts File.read('style.css')
   end

   if location == '/favicon.ico'
     client.puts File.read('favicon.ico')
   end

   if method == ('POST') 
     info = JSON.parse(req[2])
     name = info['person']['name']
     email = info['person']['email']
     body = File.read("thanks.html").gsub("<%= yield %>", "<li>Name : #{name} </li>\n                <li>Email : #{email}</li>")
     headers = "HTTP/1.0 200 OK\nDate: #{Time.now}\nContent-Type: #{File.extname('index.html')}\nContent-Length: #{body.size}\n\n "
     client.puts headers + body 
   end

    client.close
  end                 
}