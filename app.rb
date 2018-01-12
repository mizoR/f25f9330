require 'sinatra'
require 'sinatra/json'

module BlockchainStudy
  class App < Sinatra::Base

    @@blockchain = begin
      genesis = Block.new(proof: 100, previous_hash: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')

      Blockchain.new(genesis: genesis)
    end

    helpers do
      def blockchain
        @@blockchain
      end
    end

    get '/' do
      'Blockchain study'
    end

    get '/blocks' do
      blocks = blockchain.blocks

      json blocks.map(&:as_json)
    end

    post '/blocks' do
      raise NotImplementedError
    end

    put '/blocks' do
      raise NotImplementedError
    end

    post '/transactions' do
      params = JSON.parse(request.body.read, symbolize_names: true)

      transaction_params = params.slice(:sender, :recipient, :amount)

      transaction = blockchain.current_transactions.create(transaction_params)

      json transaction.as_json
    end

    put '/nodes' do
      raise NotImplementedError
    end
  end
end
