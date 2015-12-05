defmodule Concato do
  
  def concat(a, b) do
    do_concat(a, b)
  end

  defp do_concat([h|t], [a|b]) do
    [h|t] ++ [a|b]
  end

  defp do_concat(a, b) do
    a <> b
  end

end

IO.puts Concato.concat("Merry", "Christmas")
IO.inspect Concato.concat([:a, :b, :c], [1, 2, 3])