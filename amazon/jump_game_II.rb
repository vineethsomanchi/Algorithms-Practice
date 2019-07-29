def jump(nums)
    final_index = nums.length - 1
    return 0 if nums.length <= 1 
    
    jumps, current_i, next_i, max_range = 1, 0, 0, -1
    loop do 
       if(nums[current_i] + current_i >= final_index)
           return jumps
       else
           nums[(current_i+1)..(current_i + nums[current_i])].each_with_index do |val, index|
              if(max_range < val + index)
                next_i = index
                max_range = val + index
              end
           end
           current_i += next_i + 1
           jumps += 1
           max_range = -1
       end
    end
end