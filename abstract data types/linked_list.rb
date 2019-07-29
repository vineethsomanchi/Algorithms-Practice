class Node
    def initialize(value, next_node, prev_node)
        @value = value
        @next = next_node
        @prev = prev_node
    end

    private
    attr_accessor :value, :next
end

class LinkedList

  def initialize(value)
    @head = Node.new(value, nil, nil)
  end

  #Traverse to end of LL and add new node
    def add(value)
        current_node = @head
        while current_node.next != nil
            current_node = current_node.next
        end
        current_node.next = Node.new(value, nil, current_node)
    end

    #Traverse through LL until value reached and set .next equal to .next.next
    def delete(value)
        current_node = @head
        if current_node.value = value
            @head = current_node.next
        else
            while (current_node.next != nil) && (current_node.next.val != val)
                current_node = current_node.next
            end
            unless current_node.next == nil
                current_node.next = current_node.next.next
            end
        end
    end

    def return_list
        elements = []
        current_node = @head
        while current_node.next != nil
            elements << current_node
            current_node = current_node.next
        end
        elements
    end
end