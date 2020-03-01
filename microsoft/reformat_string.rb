# Given a random alpha-numeric string with no special characters, reformat the string without adding or removing any characters so that no alphabet characters are adjacent to any other alphabet characters
# and no numeric characters are adjacent to any other numeric characters, if possible, and return the modified string. If it is not possible to reformat the string in that way,
# then group all the alphabet characters at the beginning of the string and all numeric characters at the end of the string. In either case keep all alphabet 
# characters in the same order relative to each other before and after the formatting and also keep all numeric characters in the same order releative to each other before and after the formatting.

def reformat_string(str)
    
    vowels = get_vowels(str)
    nums = get_nums(str)

    vow_count = vowels.length
    num_count = nums.length
    
    if((vow_count == num_count) || (vow_count == num_count + 1) || (vow_count + 1 == num_count))
        
        first = (vow_count >= num_count ? vowels : nums)
        second = (num_count <= vow_count ? nums : vowels)

        first_counter = 0
        second_counter = 0

        (0...str.length).each do |i|
            if(i % 2 == 0)
                str[i] = first[first_counter]
                first_counter += 1
            else
                str[i] = second[second_counter]
                second_counter += 1
            end
        end

    else
   
        (0...vowels.length).each do |j|
            str[j] = vowels[j]
        end
        (0...nums.length).each do |k|
            str[vow_count + k] = nums[k]
        end

    end

    puts str
end

def get_vowels(str)
    alpha = ("a".."z").to_a
    vowels = []
    str.each_char do |c|
        if alpha.include?(c)
            vowels << c
        end
    end
    vowels
end

def get_nums(str)
    all_nums = ("0".."9").to_a
    nums = []
    str.each_char do |c|
        if all_nums.include?(c)
            nums << c
        end
    end
    nums
end

puts reformat_string("aabb12cc34567")
"a1a2b3b4c5c"

puts reformat_string("a1aa")
"aaa1"