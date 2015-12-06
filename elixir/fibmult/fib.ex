defmodule Fib do

  def run(list) do
    list
    |> Enum.map(&(fib(&1)))
    |> inspect
    |> IO.puts
  end

  def runner(list) do
    IO.puts(inspect(Enum.map(list, fn(x) -> fib(x) end )))
  end

  def fib(0) do 0 end
  def fib(1) do 1 end
  def fib(n) do fib(n - 1) + fib(n - 2) end

end

#Fib.run([[30,31,32,33,34,35,36,37,38,39,40]])
 Fib.runner([30,31,32,33,34,35,36,37,38,39,40])