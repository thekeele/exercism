defmodule Pangram do

  @alphabet Enum.map(?a..?z, &<<&1::utf8>>)

  @spec pangram?(String.t()) :: boolean
  def pangram?(""), do: false
  def pangram?(sentence) do
    pangram =
      sentence
      |> String.codepoints()
      |> Enum.reduce([], fn letter, pangram ->
        letter = String.downcase(letter)
        if letter in @alphabet and letter not in pangram, do: [letter | pangram], else: pangram
      end)
      |> Enum.sort()

    pangram === @alphabet
  end
end
