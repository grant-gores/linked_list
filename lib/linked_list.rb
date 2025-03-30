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

  def size
    size = 0
    current = @head
    while current != nil
      size += 1
      current = current.next_node
    end
    size
  end

  def head
    @head
  end

  def tail
    current = @head
    while current.next_node != nil
      current = current.next_node
    end
    current
  end

  def at(index)
    current = @head
    count = 0
    while current != nil
      if count == index
        return current
      end
      current = current.next_node
      count += 1
    end
    return nil
  end

  def pop
    return nil if @head.nil?
    if @head.next_node.nil?
      @head = nil
      return
    end

    current = @head
    while current.next_node && current.next_node.next_node
      current = current.next_node
    end

    current.next_node = nil
  end

  def contains?(value)
    current = @head
    while current != nil
      if current.value == value
        return true
      end
      current = current.next_node
    end
    false
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

list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')
list.append('work?')

p list.at(2)

p list