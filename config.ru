require 'redis'

use Rack::Static,
	:root => "public"

# rack app
class LogHours

  def self.call(env)
    r = Redis.new(:url => ENV['REDIS_URL'])
    if r.connected?
      return [200,
      {},
      'Connected']
    end
    [200,
    {},
    File.open('public/index.html',
    File::RDONLY)]
  end
end

# serve it
run LogHours