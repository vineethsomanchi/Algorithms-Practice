#Without cleansing string
def is_palindrome?(str)
    length = str.length
    (0...str.length).each do |i|
        if(str[i] != str[length - 1 - i])
            return false
        end
    end
    true
end

#Two-Liner
def is_palindrome(s)
    s = s.gsub(/[^a-zA-Z0-9]/, "").downcase
    s.reverse == s
end

#Clean string to only have alphanumeric characters

def clean_string(str)
    clean = ("a"..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
    new_str = ''
    str.each_char do |c|
        if clean.include?(c)
            new_str += c.downcase
        end
    end
    new_str
end

def is_palindrome?(str)
    s = clean_string(str)
    length = s.length
    puts s
    (0...length).each do |i|
        if(s[i] != s[length - 1 - i])
            return false
        end
    end
    true
end




puts is_palindrome?("aba")
# puts clean_string("A man, a plan, a canal: Panama")