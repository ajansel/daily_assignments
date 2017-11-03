require_relative 'poly_tree_node.rb'

class KnightPathFinder
  attr_reader :move_tree

  DELTAS = [[1, 2],
            [-1, -2],
            [2, 1],
            [-2, -1],
            [-1, 2],
            [1, -2],
            [-2, 1],
            [2, -1]
          ]

  def initialize(pos)
    @visited_positions = [pos]
    @root = PolyTreeNode.new(pos)
    build_move_tree(@root)
  end

  # def build_move_tree(node)
  #   self.new_move_positions(node.value).each do |move|
  #     new_child = PolyTreeNode.new(move)
  #     node.add_child(new_child)
  #     build_move_tree(new_child)
  #   end
  #
  #   node
  # end



  def build_move_tree(node)
    queue = [node]
    until queue.empty?
      current_node = queue.shift
      return current_node if current_node.value == target_value
      current_node.children.each do |child|
        queue << child
      end
    end
    nil
  end

  def build_move_tree(node)

    self.new_move_positions(node.value).each do |move|
      new_child = PolyTreeNode.new(move)
      node.add_child(new_child)
      # build_move_tree(new_child)
    end

    node
  end

  def new_move_positions(pos)
    new_moves = self.valid_moves(pos).reject do |move|
      @visited_positions.include?(move)
    end
    new_moves.each do |move|
      @visited_positions << move
    end
    new_moves
  end

  def valid_moves(pos)
    valid_moves = DELTAS.map do |(dx, dy)|
      [pos[0] + dx, pos[1] + dy]
    end

    valid_moves = valid_moves.select do |row, col|
      [row, col].all? do |coord|
        coord.between?(0, 7)
      end
    end

    valid_moves
  end #End of method
end


#
# kpf = KnightPathFinder.new([0,0])
# kpf.move_tree #This is huge and messy
# kpf.move_tree.children.map {|child| child.value} #This shows the children of the root
# kpf.move_tree.children[0].children.map{|child| child.value} #This shows the left child of the root
# kpf.move_tree.children[1].children.map{|child| child.value} #This shows the right child of the root, which was [] showing the need for a BFS
