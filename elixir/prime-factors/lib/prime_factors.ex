defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest.
  """
  @spec factors_for(pos_integer, pos_integer) :: [pos_integer]
  def factors_for(number), do: factors_for(number, 2)

  defp factors_for(number, _factor) when number <= 1, do: []

  defp factors_for(number, factor) when rem(number, factor) == 0,
    do: [factor | factors_for(div(number, factor), factor)]

  defp factors_for(number, factor), do: factors_for(number, factor + 1)
end
