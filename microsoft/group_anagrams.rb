#Given an array of strings, group anagrams together.

#group_by function returns hash {result => [strs], result => [strs]} where block is applied to all strs and result becomes key and input becomes value
#sorted ["eat", "tea"] --> ["a", "e", "t"] => ["eat", "tea"]
#.values return 2D array of all anagrams together
def group_anagrams(strs)
  strs.sort.group_by { |s| s.chars.sort }.values
end

def group_anagrams(strs)
    h = Hash.new([])
    strs.each do |str| #Iterate over inputs
        sorted = str.chars.sort.join #"eat" --> ["e", "a", "t"] --> ["a", "e", "t"] --> "aet"
        h[sorted] = h[sorted] + [str] #{"aet" => ["eat", "tea"] }
    end
    h.values
end  