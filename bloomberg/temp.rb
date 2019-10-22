#Five situations
#1) head == nil --> return nil
#2) no child, no next --> return head
#3) no child, next --> don't flatten, go to next
#4) child, no next --> flatten child
#5) child and next --> flatten child and go to next


def flatten(head)
    return nil if head.nil? #1
    if head.child.nil?
        return head if head.next.nil? #2
        return flatten(head.next) #3
    else
        next = Node.new
        next = head.next

        child = Node.new
        child = head.child
        head.child = nil

        child_tail = flatten(child)

        head.next = child
        child.prev = head
        if next != nil
            child_tail.next = next
            next.prev = child_tail
        end

        return child_tail
    end

end