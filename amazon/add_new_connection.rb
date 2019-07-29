#Use DFS In Order Traversal to track all nodes in some data structure
#If both nodes are part of the tree, it's invalid. Otherwise it is valid. 
#O(N)

is_valid?(root, n1, n2)
    nodes = in_order_print(root)
    return false if nodes.include?(n1) && nodes.include?(n2)
    true
end

def in_order_print(root)
    nodes = []
    return false if root == nil
    in_order_print(root.left)
    nodes << root.val
    in_order_print(root.right)  
    nodes
end