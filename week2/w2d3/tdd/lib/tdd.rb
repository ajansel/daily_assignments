require 'byebug'

def my_uniq(array)
  raise "Please pass an array." unless array.is_a?(Array)
  uniq_array = array.dup.reverse
  # debugger
  idx = 0
  while idx < array.length && idx < uniq_array.length
    if uniq_array.count(uniq_array[idx]) > 1
      uniq_array.delete_at(idx)
    else
      idx += 1
    end
  end
  uniq_array.reverse
end

def two_sum(array)
  raise "Please pass an array." unless array.is_a?(Array)
  temp_arr = []

  (0..array.length-1).each do |idx1|
    (idx1+1..array.length-1).each do |idx2|
      temp_arr << [idx1, idx2] if array[idx1] + array[idx2] == 0
    end
  end

  temp_arr
end

def my_transpose(array)
  raise "Please pass an array." unless array.is_a?(Array)

  transposed_arr = Array.new(array.length) { [] }

  array.each do |arr|
    arr.each_with_index do |el, idx|
      transposed_arr[idx] << el

    end
  end

  transposed_arr
end

def stock_picker(array)
  raise "Please pass an array." unless array.is_a?(Array)
  raise "Not enough days to create a pair." unless array.length > 1

  best_pair = [0,0]

  (0..array.length-1).each do |idx1|
    (idx1+1..array.length-1).each do |idx2|
      best_pair_range = array[best_pair[1]] - array[best_pair[0]]
      best_pair = [idx1, idx2] if array[idx2] - array[idx1] > best_pair_range
    end
  end

  best_pair
end
