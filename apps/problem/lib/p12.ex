defmodule P12 do
  @doc """
  iex> P12.solve 5
  28
  iex> P12.solve 500
  76576500
  """
  def solve(divisors_number) do
    {sentinel, nth}=
      triangle_stream()
      |> Stream.with_index(1)
      |> Stream.take_while(fn {triangle_number, idx}->
        num_of_factors(triangle_number) <= divisors_number
      end)
      |> Enum.to_list
      |> List.last

    triangle_stream() |> Enum.take(nth + 1) |> List.last
  end

  @doc """
  iex> P12.triangle_stream |> Enum.take(10)
  [1, 3, 6, 10, 15, 21, 28, 36, 45, 55]
  """
  def triangle_stream() do
    Stream.iterate(1, &Kernel.+(&1, 1))
    |> Stream.map(fn n -> n * (n + 1) / 2 end)
    |> Stream.map(&round(&1))
  end

  @doc """
  iex> P12.num_of_factors 21
  4
  iex> P12.num_of_factors 28
  6
  """
  def num_of_factors(num) do
    fsqrt = :math.sqrt(num) |> Float.floor |> round

    1..fsqrt
    |> Enum.filter(fn x -> rem(num, x) == 0 end)
    |> Enum.flat_map(fn x -> [div(num, x), x] end)
    |> Enum.dedup
    |> length
  end

end