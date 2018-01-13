class Blockchain
  attr_reader :blocks, :current_transactions

  def initialize(proof:, previous_hash:)
    @current_transactions = TransactionCollection.new(self)

    @blocks = BlockCollection.new(self).tap { |c| c.create(proof: proof, previous_hash: previous_hash) }
  end

  def proof_of_work(last_proof)
    1.step do |proof|
      s = OpenSSL::Digest::SHA256.hexdigest("#{last_proof}:#{proof}")

      return proof if s[0..3] == '0000'
    end
  end
end
