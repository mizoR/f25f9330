class TransactionCollection
  def initialize(_blockchain, transactions = [])
    @transactions = transactions
  end

  def create(params)
    transaction = Transaction.new(params)

    @transactions << transaction

    transaction
  end

  def clear
    @transactions.clear
  end

  def hash
    s = @transactions.map(&:hash).join(':')

    Digest::SHA256.hexdigest(s)
  end

  def clone
    self.class.new(@blockchain, @transactions.map(&:clone))
  end

  def as_json
    @transactions.map(&:as_json)
  end
end
