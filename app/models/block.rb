class Block
  def initialize(proof:, previous_hash:)
    @proof         = proof
    @previous_hash = previous_hash
  end

  def as_json
    {
      proof:         @proof,
      previous_hash: @previous_hash,
    }
  end
end
