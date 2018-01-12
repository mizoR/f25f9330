require 'sinatra'
require 'sinatra/json'

blockchain = begin
               genesis = Block.new(proof: 100, previous_hash: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')

               Blockchain.new(genesis: genesis)
             end

get '/' do
  'Blockchain study'
end

get '/blocks' do
  @blocks = blockchain.blocks

  json @blocks.map(&:as_json)
end

post '/blocks' do
  raise NotImplementedError
end

put '/blocks' do
  raise NotImplementedError
end

post '/transactions' do
  raise NotImplementedError
end

put '/nodes' do
  raise NotImplementedError
end
