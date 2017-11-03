class PolyTreeNode
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(node)
    @parent.children.delete(self) unless @parent == nil
    @parent = node
    @parent.children.push(self) unless @parent == nil
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "Not a child" unless self.children.include?(child_node)
    child_node.parent = nil
    self.children.delete(child_node)
  end

  def dfs(target_value)
    return self if self.value == target_value
    self.children.each do |child|
      search_result = child.dfs(target_value)
      return search_result unless search_result == nil
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      current_node = queue.shift
      return current_node if current_node.value == target_value
      current_node.children.each do |child|
        queue << child
      end
    end
    nil
  end

end
