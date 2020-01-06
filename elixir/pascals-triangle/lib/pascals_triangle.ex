defmodule PascalsTriangle do
  @spec rows(integer) :: [[integer]]
  def rows(row_height),
    do: [1] |> Stream.iterate(&compute_row(&1, [1])) |> Enum.take(row_height)

  defp compute_row([1], pascals_triangle),
    do: [1 | pascals_triangle]
  defp compute_row([left, right | rest], pascals_triangle),
    do: compute_row([right | rest], [left + right | pascals_triangle])
end
