=begin
    A tree consists of linked nodes each with a value used to simulate a hierarchical structure
    Binary tree is where each parent has 2 children
    BST is where values increase from least to greatest as you move from left to right nodes

    Preorder Traversal: Root, then left, then right (parent first)
    Inorder Traversal: Left, then root, then right 
    Postorder Traversal: Left, then right, then root (children first)
=end

class Node
    def initialize(val=nil)
        @val = val
        @left = nil
        @right = nil
    end

    private
    attr_accessor :val
    attr_reader :left, :right
end

class BST
    def initialize
        @root = nil
    end

    def insert(val, root=self.root)
        if self.root == nil #If tree empty value is set as root
            self.root = new Node(val)
        elsif val < self.root.val #If value is less than root go left (change to <= to deal with repeated values)
            if root.left == nil
                root.left = new Node(val) #If left is empty fill node
            else
                self.insert(val, root.left) #If taken, travel deeper
            end
        else #If value is greater than root go right
            if root.right == nil
                root.right = new Node(val) #If right is empty fill node
            else
                self.insert(val, root.right) #If taken, travel deeper
            end
        end
    end

    def find(val, root=self.root)
        return false if root == nil #Return false if doesn't exist
        if val < root.val
            return self.find(val, root.left) #If value less than root, recurse on left
        elsif val > root.val
            return self.find(val, root.right) #If value less than root, recurse on right
        else
            return true #Return true if root == val
        end
    end

    def delete(node)
        if self.find(node.val)
            if node.left.nil? && node.right.nil?
                node = nil
            elsif !node.left.nil? && node.right.nil?
                node = node.left
            elsif node.left.nil? && !node.right.nil?
                node = node.right
            else #If there are both right and left child, find smallest val of right subtree (leftmost child of right child), replace w node to be removed (min), remove min value node
                min = find_min(node.right)
                node.value = min.value
                min = nil
            end
        end
    end

    def find_min(node)
        if node.left.nil?
            min = node
            return min
        else
            find_min(node.left)
        end
    end

    #Left, root, right
    def in_order_traversal(root=self.root)
        return if root == nil
        in_order_traversal(root.left)
        print(root.val)
        in_order_traversal(root.right)
    end

    #Root, left, right
    def pre_order_traversal(root=self.root)
        return if root == nil
        print(root.val)
        pre_order_traversal(root.left)
        pre_order_traversal(root.right)
    end

    #Left, right, root
    def post_order_traversal(root=self.root)
        post_order_traversal(root.left)
        post_order_traversal(root.right)
        print(root.val)
    end

    def is_valid?(node, min=-1.0/0.0, max=1.0/0.0)
		until node.left.nil? && node.right.nil? 
			if min > node.value || max < node.value
				return false
			else  
				is_valid?(node.left, min, node.value)  
				is_valid?(node.right, node.value, max)
			end
		return true
	end


    private
    attr_accessor :root
end

