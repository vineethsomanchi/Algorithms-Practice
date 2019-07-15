=begin
    Built using heap - Specialized tree-based data structure which satisfies the heap property
    max-heap: For any given node, the key of the parent is greater than or equal to the key of the child
    min-heap: For any given node, the key of the parent is less than the key of the child
    binary-heap: Data structure takes the form of a binary tree where each node has at most two children
=end


class MaxHeap

    attr_accessor: :array

    def initialize
        @array = []
    end

    #Return max priority item
    def peek
        @array[0]
    end

    #Insert and bubble up -- O(logn)
    def <<(element)
        @array << element
        heapify_up(@array.size - 1)
    end

    #Pop and return max priority item and bubble down -- O(logn)
    def pop
        exchange(1, @array.size - 1) #exchange root and last element
        max = @array.pop #Return and remove last item
        heapify_down(1)
        max
    end
    
    def exchange(source, target)
        @array[source], @array[target] = @array[target], @array[source]
    end

    def heapify_up(index)
        parent_index = ((index - 1) / 2)
        return if index <= 1 #return if we reach root
        return if @array[parent_index] >= @array[index] #return if parent is greater than child [change for min]
        exchange(index, parent_index) #otherwise, exchange child with parent
        heapify_up(parent_index) #recursively keep going until base case is hit
    end

    def heapify_down(index)
        child_index = ((index * 2)+ 1)
        return if child_index > @array.size - 1 #stop at bottom of tree make sure child_index isn't a leaf node

        left_element = @array[child_index]
        right_element = @array[child_index + 1]
        child_index += 1 if right_element > left_element #find largest child

        return if @array[index] >= @array[child_index] #return if parent is already bigger [change for min]
        exchange(index, child_index) #otherwise exchange
        bubble_down(child_index) #recursively keep going until parent is larger than child
    end

end


#(1) HEAPIFY from left to right to create max heap
#(2) Reverse array and one by one POP/EXTRACT from right to left
# O(nlogn)
def heapsort(array)
    max_heap = Heap.new
    array.each do |element|
        max_heap << element
    end

    max_heap.array.reverse
    
    max_heap.array.each do |element|
        max_heap.heapify_down(element)
    end

    max_heap.array
end





    



