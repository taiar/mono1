defmodule Math do
  
  def sumlist([h|t], acc) do
    sumlist(t, h + acc)
  end

  def sumlist([], acc) do
    acc
  end

end

IO.puts Math.sumlist [2,3,5], 0