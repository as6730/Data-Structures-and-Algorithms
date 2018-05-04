# Given a doubly linked list, like the one you built, reverse it.
# You can assume that this method is monkey patching the LinkedList class
# that you built, so any methods and instance variables in that class are available to you.

# always think of pointers

class LinkedList
  # .....

  def reverse
    org_first = first
    pointer = @head

    until org_first == last
      new_first = last
      new_last = last.prev
      pointer.next = new_first
      new_first.prev = pointer
      new_last.next = @tail
      @tail.prev = new_last

      pointer = new_first
    end

    pointer.next = last
    last.prev = pointer
  end
end


# What pieces do we need to make the Cache?
# max size, proc
# What is the API of an LRU_Cache?
# What are the steps for each API?
