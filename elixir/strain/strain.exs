defmodule Strain do
  def keep([], _fun), do: []
  def keep([car | cdr], fun) do
    recur(car, fun.(car), fn -> keep(cdr, fun) end)
  end

  def discard([], _fun), do: []
  def discard([car | cdr], fun) do
    recur(car, not fun.(car), fn -> discard(cdr, fun) end)
  end

  defp recur(_car, false, fun), do: fun.()
  defp recur(car, true, fun), do: cons(car, fun.())

  defp cons(item, list), do: [item | list]
end
