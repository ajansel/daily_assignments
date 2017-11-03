def greedy_make_change(amount, coins)
  return [] if amount == 0
  used_coins = []
  selected_coin = coins.sort.select { |el| el <= amount }.max
  amount -= selected_coin
  used_coins << [selected_coin] + greedy_make_change(amount, coins)
  used_coins.flatten


  # return [] if coins.length == 0 || amount == 0
  # arr = []
  # if coins.first <= amount
  #   remainder = amount - coins.first
  #   arr << coins.first
  #   greedy_make_change(remainder,coins)
  # else
  #   greedy_make_change(amount,coins[1..-1])
  # end
  # arr
end

def make_better_change(amount, coins)
  # return [] if amount == 0
  # used_coins = []
  # best_coins = []
  #
  # selected_coins = coins.select { |el| el <= amount }
  # selected_coins.each do |coin|
  #   amount -= coin
  #   used_coins << [coin] + make_better_change(amount, selected_coins)
  #   used_coins.flatten
  # end
  #
  # if best_coins == [] || used_coins.flatten.length < best_coins.length
  #   best_coins = used_coins.flatten
  # end
  #
  # best_coins

  selected_coins = coins.select { |el| el <= amount }
  return nil if selected_coins.empty?

  used_coins = []

  selected_coins.sort.reverse.each do |coin|
    remainder = amount - coin

    if remainder > 0
      temp_check = make_better_change(remainder, selected_coins)
      used_coins << [coin] + temp_check unless temp_check == nil
    else
      used_coins << [coin]
    end
  end

  used_coins.sort_by {|combo| combo.size}.first
end
