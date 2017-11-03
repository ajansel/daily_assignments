require_relative 'board'

class Tile

  def initialize(board, pos)
    @board = board
    @pos = pos
    @face_value = "*"
    @down_value = @board[@pos] #Nil or B
  end

  def bombed?
    @face_value == 'B'
  end

  def flagged?
    @face_value == 'F'
  end

  def revealed?
    @face_value == @down_value || @face_value == 'F'
  end

  def reveal
    @face_value = @down_value
  end

  def flag
    @face_value = "F"
  end

  def neighbors
    arr = []
    r, c = @pos
    arr << @board[r-1][c-1]
  end

  def neighbor_bomb_count

  end
end
