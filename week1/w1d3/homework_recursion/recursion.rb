def sum_to(num)
  return nil if num < 1
  return 1 if num == 1
  num + sum_to(num-1)
end

def add_numbers(arr)
  #arr[0] + arr[1..-1]
  return arr[0] if arr.length <= 1
  arr[0] + add_numbers(arr[1..-1])
end

def gamma_fnc(num)
  return nil if num == 0
  return 1 if num == 1
  factorial(num - 1)
end

def factorial(num)
  return 1 if num == 0
  num * factorial(num - 1)
end

def ice_cream_shop(flavors, fav_flavor)
  return false if flavors.empty?
  return true if flavors[0] == fav_flavor
  ice_cream_shop(flavors[1..-1], fav_flavor)
end

def reverse(string)
  return string if string.length <= 1
  reverse(string[1..-1]) + string[0]
end
