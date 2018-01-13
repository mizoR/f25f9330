class BlockCollection
  include Enumerable

  def initialize(blockchain)
    @blockchain = blockchain

    @blocks = []
  end

  def each
    @blocks.each do |block|
      yield(block)
    end
  end

  def create(proof:, previous_hash: nil)
    block = Block.new(
      index:         count + 1,
      timestamp:     (Time.now.to_f * 1000).to_i,
      transactions:  @blockchain.current_transactions.clone,
      proof:         proof,
      previous_hash: previous_hash || last.hash,
    )

    @blocks << block

    @blockchain.current_transactions.clear

    block
  end

  def last
    @blocks.last
  end

  def as_json
    @blocks.map(&:as_json)
  end
end
