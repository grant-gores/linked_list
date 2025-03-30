class LinkedList
  def initialize
    @head = nil
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
    else
      current = @head
      while current.next_node != nil
        current = current.next_node
      end
      current.next_node = Node.new(value)
    end
  end

  def prepend(value)
    new_start = Node.new(value, @head)
    @head = new_start
  end

end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

list = LinkedList.new

p list.append('dog')
p list.append('cat')
p list.append('parrot')
p list.append('hamster')
p list.append('snake')
p list.append('turtle')

p list.prepend('doggie')

p list