require 'node'

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def contains?(value)
    return false unless @root
    search(@root, value)
  end

  def search(node, value)
    return false unless node
    if value < node.value
      search(node.left, value)
    elsif value > node.value
      search(node.right, value)
    else
      return true
    end
  end

  def height
    return 0 unless @root
    get_height(@root)
  end

  def get_height(node)
    return 0 if node.nil?
    node.node_height
  end

  def left_rotate(node)
    new_root = node.right
    node.right = new_root.left
    new_root.left = node
    node.node_height = [get_height(node.left), get_height(node.right)].max + 1
    new_root.node_height = [get_height(new_root.left), get_height(new_root.right)].max + 1
    new_root
  end

  def right_rotate(node)
    new_root = node.left
    node.left = new_root.right
    new_root.right = node
    node.node_height = [get_height(node.left), get_height(node.right)].max + 1
    new_root.node_height = [get_height(new_root.left), get_height(new_root.right)].max + 1
    new_root
  end

  def size
    count_nodes(@root)
  end

  def count_nodes(node)
    return 0 if node.nil?
    1 + count_nodes(node.left) + count_nodes(node.right)
  end

  def balance_check(node)
    return 0 unless node
    get_height(node.left) - get_height(node.right)
  end

  def add(value)
    unless value.is_a?(String)
      raise ArgumentError, "Value must be a string"
    end
    @root = Node.new(value) unless @root
    if not contains?(value)
      @root = add_node(@root, value)
    end
  end

  def add_node(node, value)
    return Node.new(value) unless node
    if value < node.value
      node.left = add_node(node.left, value)
    else
      node.right = add_node(node.right, value)
    end

    node.node_height = [get_height(node.left), get_height(node.right)].max + 1

    balance = balance_check(node)

    # Left rotation
    if balance > 1 && value < node.left.value
      return right_rotate(node)
    end
    # Right rotation
    if balance < -1 && value > node.right.value
      return left_rotate(node)
    end
    # Left-Right rotation
    if balance > 1 && value > node.left.value
      node.left = left_rotate(node.left)
      return right_rotate(node)
    end
    # Right-Left rotation
    if balance < -1 && value < node.right.value
      node.right = right_rotate(node.right)
      return left_rotate(node)
    end

    node
  end
end
