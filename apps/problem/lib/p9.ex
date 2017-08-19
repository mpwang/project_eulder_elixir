defmodule P9 do

  @doc """
  iex> P9.solve()
  31875000
  """
  def solve do
    for a <- 1..round(1000 / 3),
        b <- a..round((1000 - a) / 2),
        c <- b..1000,
      a + b + c == 1000, into: [] do
      [a, b, c]
    end
    |> Enum.filter(fn [a, b, c] ->
      :math.pow(a, 2) + :math.pow(b, 2) == :math.pow(c, 2)
    end)
    |> List.flatten
    |> Enum.reduce(&*/2)
    |> IO.inspect
  end
end
