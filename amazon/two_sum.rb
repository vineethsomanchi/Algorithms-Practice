def two_sum(arr, target)
    hash = {}
    arr.each_with_index do |ele, idx|
        if hash[target - ele]
            return [hash[target - ele], idx]
        else
            hash[ele] = idx
        end
    end
end

puts two_sum([2, 1, 11, 7], 9)


