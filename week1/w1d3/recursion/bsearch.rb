def bsearch(array, target)
  return array.index(target) if array.length <= 3
  mid_idx = (array.length / 2)
  front = array[0..mid_idx]
  back = array[(mid_idx)..-1]
  #
  # if mid_idx > target
  #   bsearch(front, target)
  # elsif mid_idx < target
  #   bsearch(back, target)
  # else
  #   return mid_idx
  # end

  if front.include?(target)
    bsearch(front, target)
  elsif back.include?(target)
    bsearch(back, target) + front.length-1
  end
end
