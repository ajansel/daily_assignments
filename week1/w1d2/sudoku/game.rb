require_relative "./board.rb"

class Game

  attr_reader :board

  def initialize(file)
    @board = Board.from_file(file)
  end

  def play
    until solved?
      @board.render
      value , *pos = prompt ## [1,2,3]
      @board[pos] = value
    end
  end

  def solved?

  end

  def prompt

    input.valid?
    #return an array [value, row, col]
  end

  def valid?

  end
end
