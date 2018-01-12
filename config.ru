Dir.glob("#{__dir__}/app/{**/}*.rb").each do |file|
  require_relative file
end

require __dir__ + '/app'

run Sinatra::Application
