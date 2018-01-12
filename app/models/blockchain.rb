class Blockchain
  attr_reader :blocks

  def initialize(genesis:)
    @blocks = [genesis]
  end
end
