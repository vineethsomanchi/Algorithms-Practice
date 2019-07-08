def digital_root_iter(num)
    return num if num < 10
    sum = 0
    while num > 0
        sum += num % 10
        num = num / 10
    end
    sum
end

def digital_root_recursive(num)
    return num if num < 10
    digital_root_recursive((num % 10) + (num / 10))
end
