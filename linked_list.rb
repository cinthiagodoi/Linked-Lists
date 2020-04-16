require "./node.rb"

class LinkedList
  
  def initialize
    @head = nil
  end

  def append(value)
    node = Node.new(value, nil)
    if @head.nil?
      @head = node
      return @head
    end
    current = @head
    until current.next_node.nil?
      current = current.next_node
    end
    current.next_node = node
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end

  def size
    @size = 1
    node = @head 
    stop_count = false

    while !stop_count
      if node.next_node != nil
        @size +=1
      else
        stop_count = true
      end
      node = node.next_node
    end
    @size   
  end

  def head
    @head
  end

  def tail
    node = @head
    while node.next_node != nil
      node = node.next_node
    end
    @tail = node
  end

  def at(index)
    position = 0
    node = @head

     while position != index
      if node.next_node != nil
        node = node.next_node
        position += 1
      end
    end
    node
  end

  def pop
    node = Node.new(nil, nil)
    if @head.nil?
      @head = node
      return @head
    end
    current = @head
    while current.next_node != tail
      current = current.next_node
    end
    current.next_node = nil
    @tail = current
  end

  def contains?(value)
    node = @head

    until node == nil
      return true if node.value == value
        node = node.next_node
    end
      false
  end

  def find(value)
    node = @head
    index = 0
    result = nil

    while node != nil
      result = index if node.value == value
        node = node.next_node
        index +=1
    end
    result
  end

  def to_s
    string = ""
    node = @head
    
    while node != nil
     string += "(#{node.value}) =>"
     node = node.next_node
    end
    string += "nil"
    string
  end

  def insert_at(value, index)
    node = @head
    position = 0
    
    while position != index
      return prepend(value) if index == 0
        node = node.next_node
        position += 1
    end
    before_node = at(position - 1)
    after_node = at(position + 1)
    new_node = Node.new(value)
    before_node.next_node = new_node
    new_node.next_node = after_node
  end

  def remove_at(index)
    node = @head
    removed_node = at(index)

    while node != removed_node
     node = node.next_node 
    end
    if index == 0
      new_value = node.next_node
      @head = new_value
    else
      before_node = at(index - 1)
      after_node = at(index + 1)
      before_node.next_node = after_node
    end
  end

end
