# Key Insight:
# 1. It comes down to a problem of detecting a cycle in a graph (Checking if its a DAG)
# 2. We need some sort of ordering of courses hence topological sort makes sense

# Approach 1: DFS with keeping track of on_stack nodes
# Steps:
# 1. Iterate through prereqs adding each preerq as a directed edge in graph
#    which is a map from nodes (interger) to list of nodes (array)
# 2. Now iterate through courses and do a DFS for each course
# 3. If DFS returns false for any course we return false, else we return true,
#    return false means a praticular course didn't have the prerequirements met
# 4. In dfs method we traverse the nbs and their nbs and so on for all nbs of the given node
# 5. In doing so, we keep track of the currently on stack nodes or visiting nodes if you will using on_stack.
#    The purpose of on_stack is to see if any of the courses have a circular dependency
#    or in other words if our graph has a cycle.
#    Example: 1 -> 2 -> 3 -> 4 -> 1, 1 -> 2 -> 3 -> 4 -> 2 or 1 -> 2 -> 3 -> 4 -> 3
#    Such a combo of prerequirements cannot be met due to the cycle

# Time: O(N), Essentially, O(V + E), V - number of courses, E - number of prereqs => O(V + V - 1) => O(N)
# Space: O(N)

def find_order_dfs(n, prereqs)
    @graph = Hash.new { |h, k| h[k] = Set.new() }
    @visited, @on_stack, @result = Set.new(), Set.new(), []
    prereqs.each { |u, v| @graph[u].add(v) }
    n.times { |node| return [] if !@visited.include?(node) && dfs_has_cycle?(node) } # find one not visited and start from it
    @result.size == n ? @result : []
end

def dfs_has_cycle?(node)
    @visited.add(node)
    @on_stack.add(node)
    @graph[node].each do |v|
        return true if @on_stack.include?(v)
        return true if !@visited.include?(v) && dfs_has_cycle?(v)
    end
    @result.push(node)
    @on_stack.delete(node) # Making DFS a post-order traversal: popping current when all its children are done
    false
end