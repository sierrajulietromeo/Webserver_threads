require 'socket'

#open a socket
socket = TCPServer.open('0.0.0.0', 8080)

p "Listening on :8080..."

Signal.trap(:INT) do |sig|
  p "Bye from a webserver!"
  exit
end

loop {
  connection = socket.accept
  Thread.new{
  10.times { |i|
  connection.puts i
  sleep 1
  }

connection.puts "Hello from the webserver"
connection.close

}
}
