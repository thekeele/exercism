defmodule AllYourBase do
  @spec convert(list, integer, integer) :: list | nil
  def convert([], _, _), do: nil
  def convert(_, base_a, base_b) when base_a < 2 or base_b < 2, do: nil
  def convert(digits, base_a, base_b) do
    cond do
      Enum.all?(digits, & &1 === 0) -> [0]
      Enum.any?(digits, & &1 < 0 or &1 >= base_a) -> nil
      true -> digits |> to_base10(base_a) |> from_base10(base_b)
    end
  end

  defp to_base10([], _), do: 0
  defp to_base10([digit | rest] = digits, base),
    do: (digit * pow(base, length(digits) - 1)) + to_base10(rest, base)

  defp pow(base, exponent),
    do: base |> :math.pow(exponent) |> round()

  defp from_base10(0, _), do: []
  defp from_base10(digit, base),
    do: from_base10(div(digit, base), base) ++ [rem(digit, base)]
end
