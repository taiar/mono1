defmodule Math do

  def sum_list([h|t]) do
    sum_list([h|t], 0)    
  end

  defp sum_list([head|tail], accumulator) do
    sum_list(tail, head + accumulator)
  end

  defp sum_list([], accumulator) do
    accumulator
  end

  def double_each([head|tail]) do
    [head * 2|double_each(tail)]
  end

  def double_each([]) do
    []
  end
end

IO.puts Math.sum_list([2,3,5])
IO.inspect Math.double_each([2,3,5])