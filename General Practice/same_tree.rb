def is_same_tree(p, q)
    return true if p.nil? && q.nil?
    return false if p.nil? || q.nil? || p.val != q.val
    return is_same_tree(p.left, q.left) && is_same_tree(p.right, q.right)
end