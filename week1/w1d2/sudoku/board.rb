require_relative "./tile.rb"
require 'byebug'

class Board
  def initialize(grid)
    @grid = grid
  end

  def self.from_file(file)
    grid = []
    File.readlines(file).each do |line|
      row = []
      line.chomp.each_char do |char|
        if char == "0"
          row << Tile.new()
        else
          row << Tile.new(char.to_i)
        end
      end
      grid << row
    end
    Board.new(grid)
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col].value = value
  end

  def render
    # puts "|-----|-----|-----|"
    puts "|---|---|---|"
    @grid.length.times do |idx|
      str = "|"
      @grid[idx].length.times do |idx2|
        tile = @grid[idx][idx2]
        str << "#{tile.to_s}"
        # str << "|"
        str << "|" if (idx2 + 1) % 3 == 0

      end
      puts str
      # puts "|-----|-----|-----|" if (idx + 1) % 3 == 0
      puts "|---|---|---|" if (idx + 1) % 3 == 0
    end
  end

  def solved?

  end
end
