defmodule Mathenum do

  def sum_list([h|t]) do
    Enum.reduce([h|t], 0, fn(x, acc) -> x + acc end)    
  end

  def double_each([h|t]) do
    Enum.map([h|t], fn(x) -> x * 2 end)
  end
end

IO.puts Mathenum.sum_list([2,3,5]) #=> 10
IO.inspect Mathenum.double_each([2,3,5]) #=> [4, 6, 10]