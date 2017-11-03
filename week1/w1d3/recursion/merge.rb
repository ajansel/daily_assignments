def merge_sort(arr)
  return arr if arr.length <= 1
  #split in arr half

  if arr.length.odd?
    front = arr[0..(arr.length / 2)]
    back = arr[(arr.length / 2 + 1)..-1]
  else
    front = arr[0...(arr.length / 2)]
    back = arr[(arr.length/2)..-1]
  end

  merge(merge_sort(front),merge_sort(back))
end

def merge(arr1,arr2)
  combo_arr = []

  until arr1.empty? || arr2.empty?
    if arr1.first < arr2.first
      combo_arr << arr1.shift
    else
      combo_arr << arr2.shift
    end
  end
  combo_arr + arr1 + arr2
end
