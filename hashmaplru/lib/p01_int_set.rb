require 'byebug'

class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max, nil)
  end

  def insert(num)
    raise "Out of bounds" if num > @max || num < 0
    @store.push(num)
  end

  def remove(num)
    @store.delete(num)
  end

  def include?(num)
    @store.each do |n|
      return true if n == num
    end

     false
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    unless @store.include?(num)
      idx = num % @store.length
      @store[idx] << num
    end
  end

  def remove(num)
    idx = num % @store.length
    if @store[idx].include?(num)
      @store[idx].delete(num)
    end
  end

  def include?(num)
    @store.each do |bucket|
      return true if [num] == bucket
    end
    return false
  end

  private

  def [](num)
    arr, bucket = pos
    bucket_list[arr][bucket] = pos
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless @store.flatten.include?(num)
      idx = num % @store.length
      @store[idx] << num
      @count += 1
    end

    if @count > num_buckets
      resize!
    end
  end

  def remove(num)
    idx = num % @store.length
    if @store[idx].include?(num)
      @store[idx].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    @store.each do |bucket|
      bucket.each do |el|
        return true if el == num
      end
    end
    return false

  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    resized_set = ResizingIntSet.new(num_buckets * 2)

    # debugger
  end
end
