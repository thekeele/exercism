defmodule LanguageList do
  def new(), do: []

  def add(list, language), do: [language | list]

  def remove([_head | tail]), do: tail

  def first([head | _tail]), do: head

  def count([]), do: 0
  def count([_head | tail]), do: 1 + count(tail)

  def functional_list?([]), do: false
  def functional_list?(["Elixir" | _tail]), do: true
  def functional_list?([_language | tail]), do: functional_list?(tail)
end
