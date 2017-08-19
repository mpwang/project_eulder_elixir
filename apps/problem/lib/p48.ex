defmodule P48 do

  @doc """
  iex> P48.solve 10
  405071317
  iex> P48.solve 1000
  9110846700
  """
  def solve(num) do
    modulo = round(:math.pow(10, 10))

    pow = fn n ->
      Stream.iterate(n, fn x -> rem(x * n, modulo) end)
      |> Enum.take(n)
      |> List.last
    end

    1..num
    |> Stream.map(fn n -> pow.(n) end)
    |> Enum.reduce(0, fn(sum, acc) -> rem(sum + acc, modulo) end)
  end
end
