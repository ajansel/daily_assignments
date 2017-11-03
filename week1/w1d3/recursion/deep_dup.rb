class Array

  def deep_dup
    self.map { |el| el.is_a?(Array) ? el.deep_dup : el }
  end
end
