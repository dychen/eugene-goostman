require 'typhoeus'

DEFAULT_MSG = 'hello'
URL = 'default-environment-sdqm3mrmp4.elasticbeanstalk.com/AWSBot'

def chat(msg)
  params = {
    request: msg
  }
  request = Typhoeus::Request.new(
    URL,
    method: :get,
    params: params
  )
  response = request.run
  response.body
end

def run
  puts "Eugene #1: #{DEFAULT_MSG}"
  c2 = chat DEFAULT_MSG
  puts "Eugene #2: #{c2}"
  puts ''
  while true
    c1 = chat c2
    puts "Eugene #1: #{c1}"
    c2 = chat c1
    puts "Eugene #2: #{c2}"
    gets
  end
end

run
