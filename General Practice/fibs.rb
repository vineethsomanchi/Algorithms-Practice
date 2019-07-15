def fibs_iter(num)
    return [] if num == 0
    return [0] if num == 1
    fibs = [0, 1]
    while fibs.count < num
        fibs << fibs[-1] + fibs[-2]
    end
    fibs
end

def fibs_rec(num)
    return [] if num == 0
    return [0] if num == 1
    return [0, 1] if num == 2
    prev_fibs = fibs_rec(num - 1)
    prev_fibs << prev_fibs[-1] + prev_fibs[-2]
    prev_fibs
end


puts fibs_rec(5)