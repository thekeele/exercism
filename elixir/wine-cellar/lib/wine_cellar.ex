defmodule WineCellar do
  def explain_colors do
    [
      white: "Fermented without skin contact.",
      red: "Fermented with skin contact using dark-colored grapes.",
      rose: "Fermented with some skin contact, but not enough to qualify as a red wine."
    ]
  end

  def filter(cellar, color, opts \\ []) do
    cellar
    |> do_filter(color)
    |> then(fn wines ->
      Enum.reduce(opts, wines, &apply_opts(&2, &1))
    end)
  end

  defp do_filter([], _color), do: []

  defp do_filter([{color, bottle} | cellar], color) do
    [bottle | do_filter(cellar, color)]
  end

  defp do_filter([_wine | cellar], color) do
    do_filter(cellar, color)
  end

  defp apply_opts(wines, {:year, year}) do
    filter_by_year(wines, year)
  end

  defp apply_opts(wines, {:country, country}) do
    filter_by_country(wines, country)
  end

  # The functions below do not need to be modified.

  defp filter_by_year(wines, year)
  defp filter_by_year([], _year), do: []

  defp filter_by_year([{_, year, _} = wine | tail], year) do
    [wine | filter_by_year(tail, year)]
  end

  defp filter_by_year([{_, _, _} | tail], year) do
    filter_by_year(tail, year)
  end

  defp filter_by_country(wines, country)
  defp filter_by_country([], _country), do: []

  defp filter_by_country([{_, _, country} = wine | tail], country) do
    [wine | filter_by_country(tail, country)]
  end

  defp filter_by_country([{_, _, _} | tail], country) do
    filter_by_country(tail, country)
  end
end
