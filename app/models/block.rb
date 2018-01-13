class Block
  attr_reader :proof

  def initialize(index:, timestamp:, transactions:, proof:, previous_hash:)
    @index         = index
    @timestamp     = timestamp
    @transactions  = transactions
    @proof         = proof
    @previous_hash = previous_hash
  end

  def hash
    s = [@index, @timestamp, @transactions.hash, @proof, @previous_hash].join(':')

    Digest::SHA256.hexdigest(s)
  end

  def as_json
    {
      index:         @index,
      timestamp:     @timestamp,
      transactions:  @transactions.as_json,
      proof:         @proof,
      previous_hash: @previous_hash,
      hash:          hash,
    }
  end
end
