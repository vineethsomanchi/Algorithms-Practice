=begin
    Linear data structure with flexible size
    First In First Out (FIFO)
    Private attr_reader on underlying array to allow peek, but no attr_writer to preserve FIFO
=end

class Queue
  def initialize
    @array = []
  end

  def enqueue(el)
    array.push(el)
    el
  end

  def dequeue
    array.shift
  end

  def peek
    array.first
  end

  private
  attr_reader :array

end