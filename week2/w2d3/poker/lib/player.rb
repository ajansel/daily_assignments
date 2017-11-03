class Player
  attr_reader :hand
  def initialize(name)
    @name = name
    @stack = 100
    @hand = []
  end

end
