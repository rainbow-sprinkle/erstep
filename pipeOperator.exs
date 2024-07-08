IO.puts 1..100_000
|> Enum.map(&(&1 * 3))
|> Enum.filter(&(rem(&1, 2) != 0))
|> Enum.sum()
