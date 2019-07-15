def is_palindrome?(str)
    length = str.length
    (0...str.length).each do |i|
        if(str[i] != str[length - 1 - i])
            return false
        end
    end
    true
end

puts is_palindrome?("babab")