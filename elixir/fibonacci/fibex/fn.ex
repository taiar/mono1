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
end