#Start form the head, move one step each time to the next node
#When you meet with a node with child follow its child chain to the end and connect the tail node with p.next
#Return to pointer and proceed until find next node with child.
#Repeat until reach null

def flatten_list(head)
    return head if head == nil 
    
    pointer = Node.new
    pointer = head

    while pointer !== nil
        pointer = pointer.next if(pointer.child == nil)

        temp = Node.new
        temp = pointer.child
        while(temp.next !== nil) 
            temp = temp.next
        end
        temp.next = pointer.next
        pointer.next.prev = temp if pointer.next !== nil #only doubly LL #If statement checks if pointer is a tail
        pointer.next = pointer.child
        pointer.child.prev = pointer #only doubly LL
        pointer.child = nil
    end

    return head
end

#Five situations
#1) Head = nil --> return nil
#2) No child no next --> return head
#3) No child, next --> No need to flatten, go to next
#4) Child, no next --> flatten child
#5) child and next --> Flatten child, go to next

flatten(head)
    return nil if head.nil? #1
    if head.child.nil?
        return head if head.next.nil? #2
        return flatten(head.next) #3
    else
        child = Node.new
        child = head.child
        head.child = nil
        
        next = Node.new
        next = head.next

        child_tail = Node.new
        child_tail = flatten(child)

        head.next = child
        child.prev = head
        if next != nil
            child_tail.next = next #5
            next.prev = child_tail
            return flatten(next)
        end
        
        return child_tail #4
    end
end