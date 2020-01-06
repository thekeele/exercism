defmodule Isogram do
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    letters = sentence |> String.replace(["-", " "], "") |> String.codepoints()

    letters === Enum.uniq(letters)
  end
end
