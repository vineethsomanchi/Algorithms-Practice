def sum_rec(nums)
    return 0 if nums.empty?
    nums[0] + sum_rec(nums.drop(1))
end

puts sum_rec([1, 2, 3])