def num_equiv_domino_pairs(dominoes)
    count = Hash.new(0)
    res = 0
    
    dominoes.each do |d|
        num = (d.min * 10) + d.max
        count[num] += 1
    end
    
    count.values.each do |v|
        if v > 1
            combinations = ((v * (v - 1)) / 2)
            res += combinations
        end
    end
    
    res
end