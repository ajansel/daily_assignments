def permutation(array)
  return [array] if array.length == 1

  first = array.shift
  # p first
  # p array
  perms = permutation(array)
  # p perms
  total = []

  perms.each do |perm|
    (0..perm.length).each do |i|
      # p "left: #{perm[0...i]}"
      # p "first: #{[first]}"
      # p "right #{perm[i..-1]}"
      # p "#{perm[0...i] + [first] + perm[i..-1]}"
      total << perm[0...i] + [first] + perm[i..-1]
    end
  end
  total.sort
end
