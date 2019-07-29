def is_valid(str)
    stack = []
    dir = {"("=> ")", "{"=> "}", "["=> "]"}
    str.each_char do |char|
        if dir.has_key?(char)
            stack.push(char)
        else
            if stack.length > 0
                top_ele = stack.pop
            else
                top_ele = "#"
            end
            return false if dir[top_ele] != char        
        end
    end
    stack.empty?
end