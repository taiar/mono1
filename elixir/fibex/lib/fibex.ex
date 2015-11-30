defmodule Fibex do
  def run(ns) do
    
    Enum.map(Fibex.Fn.run(ns))
    |> inspect
    |> IO.puts
  end
end