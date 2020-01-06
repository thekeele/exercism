defmodule WordCount do
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.replace(~r/[,:!&@$%^&]/, "")
    |> String.split([" ", "_"], trim: true)
    |> Enum.reduce(%{}, fn word, frequency ->
      Map.update(frequency, word, 1, & &1 + 1)
    end)
  end
end
