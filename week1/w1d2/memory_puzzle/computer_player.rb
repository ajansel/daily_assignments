class ComputerPlayer
  def initialize(name, size = [2,3])
    @name = name
    @size = size
    @known_cards = Hash.new{ |h,k| h[k] = [] }
    @match_cards = []
  end

  def prompt(previous_guess = nil)
    debugger

    pos = nil
    if previous_guess == nil
      @known_cards.each { |k,v| pos = v[0] if v.length == 2 }
       pos = get_random if pos == nil
    else
      @known_cards.each { |k,v| pos = v[1] if v.length == 2 && v[1] != previous_guess}
      @known_cards.each { |k,v| pos = v[0] if v.length == 2 && v[0] != previous_guess}
      pos = get_random if pos == nil
    end
    debugger
    pos
  end

  def get_random
    seen_values = []
    @known_cards.each { |k,v| v.each { |pos| seen_values << pos } }

    position = seen_values.sample
    while seen_values.include?(position) || @match_cards.include?(position)
      position = [rand(@size[0]),rand(@size[1])]
    end
    debugger
    position
  end

  def receive_revealed_card(pos, value)
    @known_cards[value] << pos unless @known_cards[value].include?(pos)
  end

  def receive_match(pos1, pos2)
    @match_cards << pos1
    @match_cards << pos2
    @known_cards.delete_if { |k,v| v.include?(pos1) && v.include?(pos2)}
  end
end
