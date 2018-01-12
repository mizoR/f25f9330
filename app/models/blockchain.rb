class Blockchain
  attr_reader :blocks, :current_transactions

  def initialize(genesis:)
    @blocks = [genesis]
    @current_transactions = TransactionCollection.new([])
  end
end
