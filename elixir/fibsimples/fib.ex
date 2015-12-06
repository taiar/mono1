defmodule Fib do

  def fib(0) do 0 end
  def fib(1) do 1 end
  def fib(n) do fib(n - 1) + fib(n - 2) end

end

IO.puts Fib.fib(0)
IO.puts Fib.fib(1)
IO.puts Fib.fib(2)
IO.puts Fib.fib(3)
IO.puts Fib.fib(4)
IO.puts Fib.fib(5)
IO.puts Fib.fib(6)
IO.puts Fib.fib(7)
IO.puts Fib.fib(8)