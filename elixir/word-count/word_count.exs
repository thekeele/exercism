defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
    |> String.split([" ", "_", ",", ":", "!"])
    |> Enum.reduce(%{}, &word_frequency/2)
  end

  defp word_frequency("", histogram), do: histogram
  defp word_frequency(word, histogram) do
    if String.contains?(word, "&") do
      histogram
    else
      histogram
      |> Map.get_and_update(String.downcase(word), &({&1, (&1 || 0) + 1}))
      |> elem(1)
    end
  end
end