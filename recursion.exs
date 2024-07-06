defmodule Recursion do
  def multiply(n) do
    multiply(n, 1)
  end
  def multiply(0, acc) do
    acc
  end
  def multiply(n, acc) when n > 0 do
    multiply(n-1, n*acc)
  end
end

IO.puts Recursion.multiply(10)
