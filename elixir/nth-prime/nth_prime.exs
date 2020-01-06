defmodule Prime do

  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) when count < 1, do: raise ArithmeticError
  def nth(1), do: 2
  def nth(count) do
    Stream.iterate(2, &next_number/1)
    |> Enum.take(count)
    |> List.last()
  end

  defp next_number(number) do
    if is_prime?(number + 1) do
      number + 1
    else
      next_number(number + 1)
    end
  end

  defp is_prime?(n, factor \\ 2) do
    cond do
      factor > n / factor -> true
      rem(n, factor) == 0 -> false
      true -> is_prime?(n, factor + 1)
    end
  end
end
