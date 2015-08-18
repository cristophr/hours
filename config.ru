
require 'redis'
use Rack::Static,
	:root => "public"

# rack app
class LogHours
  def self.call(env)
    rd = Redis.new # try to con
    puts rd.get 't'
    [200,
    {},
    File.open('public/index.html',
    File::RDONLY)]
  end
end

# serve it
run LogHours