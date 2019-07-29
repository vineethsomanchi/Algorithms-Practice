def interval_intersection(a, b)
    i = j = 0
    intersection = []
    while i < a.count && j < b.count
        lo = [a[i][0], b[j][0]].max #Max of both starting numbers
        hi = [a[i][1], b[j][1]].min #Min of both ending numbers
        if lo <= hi
            intersection << [lo, hi]
        end
        if a[i][1] < b[j][1] #If a's end point is less than b's then we move to next a. OTherwise, move to next b
            i += 1
        else
            j += 1
        end
    end
    
    return intersection
end