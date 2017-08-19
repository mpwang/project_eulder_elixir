defmodule P42 do

  @doc """

  iex> P42.solve()
  162
  """
  def solve do
    File.stream!("#{__DIR__}/p042_words.txt")
    |> words
    |> words_to_numbers
    |> Enum.filter(&triangle_number?(&1))
    |> length
  end

  def words(stream) do
    stream |> Enum.take(1) |> List.first |> String.split(~r/,/)
  end

  def words_to_numbers(words) do
    Enum.map(words, fn word ->
      word
      |> String.replace(~s("), "")
      |> String.codepoints
      |> Enum.map(fn char ->
        <<num, 0>> = char <> <<0>>
        num - 64
      end)
      |> Enum.sum
    end)    
  end

  def triangle_number?(n) do
    Stream.iterate(1, fn x -> x + 1 end)
    |> Stream.map(fn x -> round(x * (x + 1) / 2) end)
    |> Stream.take_while(fn x -> x <= n end)
    |> Enum.to_list
    |> List.last
    |> Kernel.==(n)
  end
end
