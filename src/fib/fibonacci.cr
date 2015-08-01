module Fibonacci
  extend self

  def calculate(n)
    return 0 if n == 0 
    return 1 if n == 1 
    return calculate(n-1) + calculate(n-2)
  end

end