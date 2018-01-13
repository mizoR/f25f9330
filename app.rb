require 'sinatra'
require 'sinatra/json'

module BlockchainStudy
  class App < Sinatra::Base

    @@blockchain = Blockchain.new(
      proof:         100,
      previous_hash: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
    )

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
      last_block = blockchain.blocks.last

      proof = blockchain.proof_of_work(last_block.proof)

      blockchain.current_transactions.create(
        sender:    '0',
        recipient: ENV['BLOCKCHAIN_MINER_ADDRESS'],
        amount:    1,
      )

      block = blockchain.blocks.create(
        proof: proof,
      )

      json block.as_json
    end

    put '/blocks' do
      raise NotImplementedError
    end

    get '/transactions' do
      transactions = blockchain.current_transactions

      json transactions.as_json
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
