defmodule SimpleCipher do
  def encode(plaintext, key) do
    translate(plaintext, key, &right_shift/1)
  end

  def decode(ciphertext, key) do
    translate(ciphertext, key, &left_shift/1)
  end

  defp translate(text, key, shift) do
    key
    |> to_charlist()
    |> Stream.cycle()
    |> Enum.zip(to_charlist(text))
    |> Enum.map(shift)
    |> to_string()
  end

  defp right_shift({key, letter}) when letter in ?a..?z,
    do: ?a + Integer.mod(letter - ?a + key - ?a, 26)
  defp right_shift({_, letter}), do: letter

  defp left_shift({key, letter}) when letter in ?a..?z,
    do: ?a + Integer.mod(letter - key, 26)
  defp left_shift({_, letter}), do: letter
end
