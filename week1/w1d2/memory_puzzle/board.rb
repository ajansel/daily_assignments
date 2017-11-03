require_relative './card.rb'

class Board
  attr_reader :grid

  def initialize(size = [2,3])
    @grid = populate(size)
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def populate(size)
    new_arr = Array.new(size[0]) {Array.new(size[1])}
    idx = 0
    cards = create_cards(size)
    while idx < new_arr.length
      new_arr[idx].each_with_index { |el,idx2| new_arr[idx][idx2] = cards.pop }
      idx += 1
    end
    new_arr
  end

  def create_cards(size)
    num_of_pairs = (size[0]*size[1]) / 2
    cards = []
    num_of_pairs.times do |el|
      cards << Card.new(el)
      cards << Card.new(el)
    end
    cards.shuffle
  end

  def render

    @grid.length.times do |idx|
      str = ""
      @grid[idx].length.times do |idx2|
        card = @grid[idx][idx2]
        str << "#{card.to_s} "
      end
      puts str
    end
  end

  def won?
    @grid.all? { |arr| arr.all? { |card| card.face_up }  }
  end

  def reveal(guessed_pos)
    self[guessed_pos].reveal
    self[guessed_pos].value
  end
end
