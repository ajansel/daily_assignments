class Card

  attr_reader :value, :face_up

  def initialize(value)
    @value = value
    @face_up = false
  end

  def to_s
    return @value.to_s if @face_up
    "?"
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  def ==(card)
    @value == card.value
  end
end
