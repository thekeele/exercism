defmodule Atbash do
  @spec encode(String.t()) :: String.t()
  def encode(plaintext) do
    plaintext |> substitute() |> Enum.chunk_every(5) |> Enum.join(" ")
  end

  @spec decode(String.t()) :: String.t()
  def decode(cipher) do
    cipher |> substitute() |> to_string()
  end

  defp substitute(text) when is_binary(text),
    do: text |> String.downcase() |> to_charlist |> Enum.reduce([], &substitute/2)
  defp substitute(letter, cipher) when letter in ?a..?z,
    do: cipher ++ [(?a + ?z) - letter]
  defp substitute(number, cipher) when number in ?0..?9,
    do: cipher ++ [number]
  defp substitute(_, cipher),
    do: cipher
end
