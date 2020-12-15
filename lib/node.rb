# Representing a node in a linked list ADT
class Node
  attr_accessor :data, :next
  def initialize(data = nil, next_node = nil)
    @data = data
    @next = next_node
  end
end
