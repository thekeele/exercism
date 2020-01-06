defmodule Hexadecimal do
  @hex_alphabet %{
    "a" => 10, "A" => 10, "b" => 11, "B" => 11, "c" => 12, "C" => 12,
    "d" => 13, "D" => 13, "e" => 14, "E" => 14, "f" => 15, "F" => 15,
  }

  @spec to_decimal(binary) :: integer
  def to_decimal(hex) do
    if Regex.match?(~r/^[a-fA-F0-9]*$/, hex), do: from_hex(hex), else: 0
  end

  defp from_hex(""), do: 0
  defp from_hex(<<char::binary-size(1), rest::binary>> = hex) do
    from_hex(rest) + (to_integer(char) * pow(String.length(hex) - 1))
  end

  defp to_integer(char) do
    if char in Map.keys(@hex_alphabet), do: @hex_alphabet[char], else: String.to_integer(char)
  end

  defp pow(exp, base \\ 16), do: base |> :math.pow(exp) |> round()
end
