require 'redis'

use Rack::Static,
	:root => "public"

# rack app
class LogHours

  def self.call(env)
    r = Redis.new(:url => 'redis://h:p7bqrbmo2cjc8d62dbkhivs99ho@ec2-54-83-205-71.compute-1.amazonaws.com:11479')
    if r.connected?
      [200,
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