defmodule Recursion do
  # calculate n!
  def multiply(n) do
    multiply(n, 1)
  end
  def multiply(0, acc) do
    acc
  end
  def multiply(n, acc) when n > 0 do
    multiply(n-1, n*acc)
  end
  # calculate sum of array - reduce
  def sum_list([head | tail], acc) do
    sum_list(tail, acc + head)
  end
  def sum_list([], acc) do
    acc
  end
  # calculate double all of the values in the list
  def double_each([head | tail]) do
    [head * 2 | double_each(tail)]
  end
  def double_each([]) do
    []
  end
end

list = [1,2,3,4,5,6,7,8,9]
IO.puts Recursion.multiply(10)
IO.puts Recursion.sum_list(list, 0)
IO.inspect Recursion.double_each(list)

range = 1..9
IO.puts Enum.reduce(range, 0, &+/2)
IO.inspect Enum.map(range, fn x -> x* 2 end)
