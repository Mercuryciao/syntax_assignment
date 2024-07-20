class Node
  attr_accessor :value, :left, :right, :node_height

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
    @node_height = 1
  end
end
