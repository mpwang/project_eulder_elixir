defmodule Problem do
  @moduledoc """
  Documentation for Problem.
  """

  defmacro answer(do: body) do
    quote do
      {time, result} = fn -> unquote(body) end |> :timer.tc
      IO.puts "Result: #{result}, Time: #{time}ms"
    end
  end
end
