def candy_crush(str)
    stack = []
    sol = ''

    str.each_char do |char|
        if stack.empty?
            stack.push([char, 1])
        elsif(stack.last[0] == char)
            repeated_ele = stack.pop
            if repeated_ele[1] < 2 #Changed based on question
                repeated_ele[1] += 1
                stack.push(repeated_ele)
            end
        else
            stack.push([char, 1])
        end
    end

    stack.length.times do |i|
        shifted = stack.shift
        sol += shifted[0]
    end

    sol
end


test = "aaabbbacd"
puts candy_crush(test)