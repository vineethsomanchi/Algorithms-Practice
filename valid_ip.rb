def valid_ip?(str)
    nums = str.split(".").map(&:to_i)
    return false if(nums.length > 4 || nums.length < 1)
    nums.each do |num|
        return false if num < 0 || num > 255
    end
    true
end

puts valid_ip?("255.256.255.255")