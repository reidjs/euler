'''
Simple binary search tree with search function
http://rubyalgorithms.com/binary_search_tree.html
'''
class BST
  class Node
    attr_accessor :key, :left, :right
    def initialize(key)
      @key = key
      @left = nil
      @right = nil
    end
    def insert(new_key)
      if new_key <= @key
        @left.nil? ? @left = Node.new(new_key) : @left.insert(new_key)
      elsif new_key > @key
        @right.nil? ? @right = Node.new(new_key) : @right.insert(new_key)
      end
    end
  end
  attr_accessor :root
  def initialize
    @root = nil
  end
  def insert(key)
    if @root.nil?
      @root = Node.new(key)
    else
      root.insert(key)
    end
  end
  def search(key, node=@root)
    return nil if node.nil?
    if key < node.key
      search(key, node.left)
    elsif key > node.key
      search(key, node.right)
    else
      return node
    end
  end
end
