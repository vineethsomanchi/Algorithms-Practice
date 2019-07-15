def sum_from_file(file)
    nums = File.readlines(file).select { |line| line[0] != "#" }.map{&:to_i}
    nums.inject(:+)
end