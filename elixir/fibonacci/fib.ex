defmodule Fib do
  def run(ns) do
    ns
    |> Enum.map(&(fib(&1)))
    |> inspect
    |> IO.puts
  end

  def fib(0) do
    0
  end

  def fib(1) do
    1
  end

  def fib(n) do
    fib(n - 1) + fib(n - 2)
  end
end

Fib.run([0,1,2,3,4,5,6,7,8, 30, 31, 32, 33, 34, 35, 36, 50, 51, 52, 53, 54])