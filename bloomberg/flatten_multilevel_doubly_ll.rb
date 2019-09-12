#Start form the head , move one step each time to the next node
#When meet with a node with child follow its child chain to the end and connect the tail node with p.next
#Return to pointer and proceed until find next node with child.
#Repeat until reach null

def flatten_list(head)
    if head == nil return head
    
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