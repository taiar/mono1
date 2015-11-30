defmodule Fibex do
  def run(ns) do
    ns
    |> Enum.map(&(Fibex.Fn.run(&1)))
    |> inspect
    |> IO.puts
  end
end

defmodule Fibex.Fn do
  def run(n) do
    run(n, 1, 0)
  end

  defp run(0, _, _) do
    0
  end
  defp run(1, a, b) do
    a + b
  end
  defp run(n, a, b) do
    run(n - 1, b, a + b)
  end

  def runBad(n) do
    if n < 3 do 
      1
    else
      runBad(n - 1) + runBad(n - 2)
    end
  end
end

Fibex.run([32, 33, 34, 35, 36, 37])