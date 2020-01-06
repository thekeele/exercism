defmodule ListOps do
  # Scheme Influenced
  # https://en.wikipedia.org/wiki/Cons

  @spec count(list) :: non_neg_integer
  def count([]), do: 0
  def count([_ | cdr]), do: 1 + count(cdr)

  @spec reverse(list) :: list
  def reverse([]), do: []
  def reverse(l), do: reduce(l, [], &cons/2)

  defp cons(car, acc), do: [car | acc]

  @spec map(list, (any -> any)) :: list
  def map([], _), do: []
  def map([car | cdr], f), do: cons(f.(car), map(cdr, f))

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], _), do: []
  def filter([car | cdr], f) do
    if f.(car), do: cons(car, filter(cdr, f)), else: filter(cdr, f)
  end

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce([], acc, _), do: acc
  def reduce([car | cdr], acc, f), do: reduce(cdr, f.(car, acc), f)

  @spec append(list, list) :: list
  def append([], []), do: []
  def append(a, []), do: a
  def append([], b), do: b
  def append([car | cdr], b), do: cons(car, append(cdr, b))

  @spec concat([[any]]) :: [any]
  def concat([]), do: []
  def concat([car | cdr]), do: append(car, concat(cdr))
end
