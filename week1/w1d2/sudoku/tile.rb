class Tile
  def initialize(value = nil)
    @value = value
    @provided_tile = value != nil 
  end

  def value=(new_value)
    @value = new_value unless @provided_tile
  end

  def to_s
    return " " if @value.nil?
    @value.to_s
  end
end
