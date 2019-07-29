def str_str(haystack, needle)
    return haystack.index(needle) if haystack.include?(needle) 
    return -1
end

def str_str(haystack, needle)
  to_i(haystack.index(needle))
end

def to_i(i)
  i.nil? ? -1 : i      
end