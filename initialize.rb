require "./linked_list.rb"

linked_list = LinkedList.new 

 linked_list.append(1)
 linked_list.append(4)
 linked_list.append(10)
 linked_list.prepend(20)
 linked_list.append(100)

linked_list.remove_at(0)
p linked_list