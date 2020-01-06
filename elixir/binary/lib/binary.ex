defmodule Binary do
  @spec to_decimal(String.t()) :: non_neg_integer
  def to_decimal(string) do
    binary? = Regex.match?(~r/^[10]*$/, string)
    if binary?, do: string |> String.reverse() |> binary_powers(), else: 0
  end

  defp binary_powers(binary, position \\ 0)
  defp binary_powers("", _),
    do: 0
  defp binary_powers("0" <> binary, position),
    do: binary_powers(binary, position + 1)
  defp binary_powers("1" <> binary, position),
    do: (1 * 2 |> :math.pow(position) |> round()) + binary_powers(binary, position + 1)
end
