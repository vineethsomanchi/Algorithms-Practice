def two_city_sched_cost(costs)
    min_cost = 0
    sorted = costs.sort {|a,b| (a[0] - a[1]) <=> (b[0] - b[1]) }
    (0...sorted.length / 2).each do |i|
        min_cost += sorted[i][0] + sorted[i + sorted.length/2][1]
    end
    min_cost
end