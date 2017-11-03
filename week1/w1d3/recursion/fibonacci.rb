def fibonacci(n)
  return nil if n < 0
  return 0 if n == 0
  return 1 if n == 1
  fibonacci(n - 1) + fibonacci(n - 2)
end

def fib(n)
  prevprev = 0
  prev = 1
  return prevprev if n == 0
  return prev if n == 1

  total = prev + prevprev 
  (n-1).times do
    total += prevprev
    prevprev = prev
    prev = total
  end
  total
end
