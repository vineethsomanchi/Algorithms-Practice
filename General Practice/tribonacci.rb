def tribonacci(n)
    index = 2
    arr = [0, 1, 1]
    return arr[n] if n <= 2
    
    while index < n
        temp = arr.sum
        arr[0] = arr[1]
        arr[1] = arr[2]
        arr[2] = temp
        index += 1
    end
    
    arr[-1]
end
