class TransactionCollection
  def initialize(transactions)
    @transactions = transactions
  end

  def create(params)
    transaction = Transaction.new(params)

    @transactions << transaction

    transaction
  end

  def as_json
    @transactions.map(&:as_json)
  end
end
