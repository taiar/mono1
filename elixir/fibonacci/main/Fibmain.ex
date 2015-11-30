defmodule Fibmain do

  def main(argv) do
    argv |> Enum.map(&(String.to_integer(&1))) |> run
  end

  def run(ns) do
    ns
    |> Enum.with_index
    |> Enum.map fn(ni) ->
      spawn_run(self, ni)
    end

    receive_fibs(length(ns), [])
  end

  defp receive_fibs(lns, result) do
    receive do
      fib ->
        result = [fib | result]

        if lns == 1 do
          IO.puts(print_fibs(result))
        else
          receive_fibs(lns - 1, result)
        end
    end
  end

  defp print_fibs(fibs) do
    fibs
    |> Enum.sort(fn({_, a}, {_, b}) -> a < b end)
    |> Enum.map(fn({f, _}) -> f end)
    |> inspect
  end

  def spawn_run(pid, ni) do
    spawn __MODULE__, :send_run, [pid, ni]
  end

  def send_run(pid, {n, i}) do
    send pid, {fib(n), i}
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
