require 'redis'

use Rack::Static,
	:root => "public"

# rack app
class LogHours

  def self.call(env)
    [200,
    {},
    ENV['REDIS_URL']]
  end
end

# serve it
run LogHours