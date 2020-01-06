defmodule Year do
  @spec leap_year?(non_neg_integer) :: boolean

  defguard is_leap_year?(year)
           when rem(year, 400) === 0
           or rem(year, 100) !== 0
           and rem(year, 4) === 0

  def leap_year?(year) when is_leap_year?(year), do: true
  def leap_year?(_), do: false
end
