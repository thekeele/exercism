defmodule Anagram do
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    candidates
    |> Enum.reduce([], fn candidate, matches ->
      candidate
      |> anagram?(base)
      |> case do
        true -> [candidate | matches]
        false -> matches
      end
    end)
    |> Enum.reverse()
  end

  defp anagram?(base, candidate) do
    base_letters = base |> String.downcase() |> String.codepoints()
    candidate_letters = candidate |> String.downcase() |> String.codepoints()

    cond do
      base_letters == candidate_letters -> false
      length(base_letters) != length(candidate_letters) -> false
      true -> Enum.sort(base_letters) == Enum.sort(candidate_letters)
    end
  end
end
