defmodule Sublist do

  def compare(a, b) do
    cond do
      a === b -> :equal
      sublist?(a, b) -> :sublist
      sublist?(b, a) -> :superlist
      true -> :unequal
    end
  end

  def sublist?(_, []), do: false
  def sublist?(a, b) do
    List.starts_with?(b, a) or sublist?(a, tl(b))
  end
end
