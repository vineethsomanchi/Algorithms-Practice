=begin
    Linear data structure with flexible size
    Last In First Out (LIFO)
    Private attr_reader on underlying array to allow peek, but no attr_writer to preserve LIFO
=end

class Stack
  def initialize
    @array = []
  end

  def push(el)
    array.push(el)
    el
  end

  def pop
    array.pop
  end

  def peek
    array.last
  end

  private
  attr_reader :array

end