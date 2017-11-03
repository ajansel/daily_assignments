def range(first,last)
  return [] if last < first
  return [] if last == 1
  arr = range(first, last - 1)
  arr << last - 1
end

def rec_sum_of(arr)
  return 0 if arr.length == 0
  arr[0] + rec_sum_of(arr[1..-1])
end

def it_sum_of(arr)
  arr.reduce(0,:+)
end
