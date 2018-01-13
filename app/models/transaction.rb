class Transaction
  def initialize(sender:, recipient:, amount:)
    @sender    = sender
    @recipient = recipient
    @amount    = amount.to_i
  end

  def hash
    s = [@sender, @recipient, @amount].join(':')

    Digest::SHA256.hexdigest(s)
  end

  def as_json
    {
      sender:    @sender,
      recipient: @recipient,
      amount:    @amount,
    }
  end
end
