#Uses stack (because recursion)
def dfs(root, target)
    return nil if root == nil
    return root if root.value == target
    root.children.each do |child|
        result = dfs(child, target)
        return result unless result.nil?
    end
    nil
end

def dfs(target = nil, &prc)
    raise "Need a proc or target" if [target, prc].none?
    prc ||= Proc.new { |node| node.value == target }

    return self if prc.call(self)

    children.each do |child|
      result = child.dfs(&prc)
      return result unless result.nil?
    end

    nil
  end