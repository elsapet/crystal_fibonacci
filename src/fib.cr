require "./fib/*"
require "http/server"

server = HTTP::Server.new(8080) do |request|
  page = HtmlPage.new
  path_parser = PathParser.new(request.path)
  
  if path_parser.path == "fibonacci"
    fib_n = path_parser.param("fib").to_i
    fib_result = Fibonacci.calculate(fib_n)
    page.add_fragment "Hello Fibonacci #{fib_n} = #{fib_result}"
    HTTP::Response.ok "text/html", page.render
  else
    page.add_fragment "Hello world <b>Time:</b>#{Time.now}"
    HTTP::Response.ok "text/html", page.render
  end
end

puts "Listening on http://0.0.0.0:8080"
server.listen