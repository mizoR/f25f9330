Dir.glob("#{__dir__}/app/{**/}*.rb").each do |file|
  require_relative file
end

require __dir__ + '/app'

ENV['BLOCKCHAIN_MINER_ADDRESS'] ||= SecureRandom.uuid

run BlockchainStudy::App
