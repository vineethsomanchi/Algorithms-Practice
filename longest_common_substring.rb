#O(n^2 * m)
def longest_common_substring(str1, str2)
    longest = ""
    start_idx = 0
    while start_idx < str1.length
        len = longest.length
        while (start_idx + len <= str1.length)
            end_idx = start_idx + len
            sub = str1[start_idx..end_idx]
            longest = sub if str2.include?(sub)
            len += 1
        end
        start_idx += 1
    end
    longest
end

#O(n * m)
def make_matrix(str1, str2)
    matrix = Array.new(str1.length + 1) {Array.new(str2.length + 1, 0)}
    str1.each_char.with_index do |char1, idx1|
        str2.each_char.with_index do |char2, idx2|
            if char1 == char2 
                matrix[idx1 + 1][idx2 + 1] = matrix[idx1][idx2] + 1
            else
                matrix[idx1 + 1][idx2 + 1] = 0
            end
        end
    end
    matrix
end

def longest_common_substring_with_matrix(str1, str2)
    matrix = make_matrix(str1, str2)
    largest = ""
    matrix.each_with_index do |row, idx1|
        row.each_with_index do |length, idx2|
            if length > largest.length
                largest = str2[idx2 - length...idx2]
            end
        end
    end
    largest
end

puts longest_common_substring_with_matrix("saiduajsidsjooo", "saidiasdooosaidh")