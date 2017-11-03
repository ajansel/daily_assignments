def subsets(arr)
  return [[]] if arr.empty?
  # return arr if arr.length == 1
  ss = subsets(arr[0..-2])

  ssnew = ss.map do |subs|
    subs + [arr[-1]]
  end
  ss += ssnew
end
