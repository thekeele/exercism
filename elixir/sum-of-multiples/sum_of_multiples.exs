defmodule SumOfMultiples do
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer

  def to(limit, factors) do
    Enum.reduce(2..(limit - 1), 0, fn number, sum ->
      multipe? = Enum.any?(factors, &(rem(number, &1) == 0))
      if multipe?, do: sum + number, else: sum
    end)
  end
end
