defmodule CollatzConjecture do
  defguard is_even(value) when is_integer(value) and value > 0 and rem(value, 2) === 0
  defguard is_odd(value) when is_integer(value) and value > 0 and rem(value, 2) != 0

  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(1), do: 0
  def calc(num) when is_even(num), do: 1 + calc(div(num, 2))
  def calc(num) when is_odd(num), do: 1 + calc(num * 3 + 1)
  def calc(_), do: raise FunctionClauseError
end
