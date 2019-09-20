#Recursive
def merge_trees(t1, t2)
    result = TreeNode.new(0)
    if t1.nil? && t2.nil?
        result = nil
    elsif t1.nil?
        result = t2
    elsif t2.nil?
        result = t1
    else
        result.val = t1.val + t2.val
        result.left = merge_trees(t1.left, t2.left)
        result.right = merge_trees(t1.right, t2.right)
    end

    result
end


#Iterative - Use Stack
