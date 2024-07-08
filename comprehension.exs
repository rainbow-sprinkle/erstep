for n <- [1,2,3,4], do: IO.puts n * n
for i<- [:a, :b, :c], j <- [1,2], do: IO.inspect {i, j}
pixels = <<213, 45, 132, 64, 76, 32, 76, 0, 0, 234, 32, 15>>
for <<r::4, g::4, b::4 <- pixels>>, do: IO.inspect {r, g, b}
