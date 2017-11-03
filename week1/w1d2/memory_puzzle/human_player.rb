class HumanPlayer
  def initialize(name, size = [2,3])
    @name = name
  end

  def prompt(previous_guess = nil)
    # while true
      puts "#{@name}, enter a position (ex: 0,0):"
      input = gets.chomp
    # break if valid_input?(input)
    # end
  pos = [input[0].to_i,input[2].to_i]
  end

  def receive_revealed_card(pos, value)
  end

  def receive_match(pos1,pos2)
  end
end
