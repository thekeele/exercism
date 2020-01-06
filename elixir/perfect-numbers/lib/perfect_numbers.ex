defmodule PerfectNumbers do
  @spec classify(number :: integer) :: {:ok, atom} | {:error, String.t()}
  def classify(number) when number > 0 do
    case aliquot_sum(number) do
      sum when sum === number -> {:ok, :perfect}
      sum when sum > number -> {:ok, :abundant}
      sum when sum < number -> {:ok, :deficient}
    end
  end

  def classify(_),
    do: {:error, "Classification is only possible for natural numbers."}

  defp aliquot_sum(number),
    do: aliquot_sum(number, div(number, 2), [])
  defp aliquot_sum(_, 0, sum),
    do: Enum.sum(sum)
  defp aliquot_sum(number, index, sum) when rem(number, index) === 0,
    do: aliquot_sum(number, index - 1, [index | sum])
  defp aliquot_sum(number, index, sum),
    do: aliquot_sum(number, index - 1, sum)
end
