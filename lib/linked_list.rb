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

  def find(value)
    current = @head
    count = 0
    while current != nil
      if current.value == value
        return count
      end
      current = current.next_node
      count += 1
    end
    return nil
  end

  def to_s
    list = []
    current = @head
    while current != nil
      list << "(#{current.value})"
      current = current.next_node
    end
    list.join(" -> ") + " -> nil"
  end

  def insert_at(value, index)
    if index == 0
      new_node = Node.new(value)
      new_node.next_node = @head
      @head = new_node
      return
    end

    current = @head
    count = 0
    
    # Traverse until we find the node just before the index
    while current != nil && count < index - 1
      current = current.next_node
      count += 1
    end
    
    # If we've reached the index
    if current != nil
      new_node = Node.new(value)
      new_node.next_node = current.next_node  # New node points to the next node
      current.next_node = new_node  # Previous node points to the new node
    else
      puts "Index out of bounds"
    end
  end

    def remove_at(index)
      # If removing the head node
      if index == 0
        @head = @head.next_node
        return
      end
      
      current = @head
      count = 0
      
      # Traverse until we find the node just before the one to remove
      while current != nil && count < index - 1
        current = current.next_node
        count += 1
      end
      
      # If the index is valid, remove the node
      if current != nil && current.next_node != nil
        current.next_node = current.next_node.next_node
      else
        puts "Index out of bounds"
      end
    end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
