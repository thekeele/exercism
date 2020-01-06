defmodule Matrix do
  @enforce_keys [:data, :rows, :columns]
  defstruct data: [], rows: 0, columns: 0

  @spec from_string(input :: String.t()) :: %Matrix{}
  def from_string(input) do
    rows = input |> String.replace(" ", "") |> String.split("\n")
    len = length(rows)
    data =
      Enum.reduce(rows, [], fn row, acc ->
        acc ++
        (row |> String.codepoints() |> Enum.map(&String.to_integer/1))
      end)

    %Matrix{rows: len, columns: len, data: data}
  end

  @spec to_string(matrix :: %Matrix{}) :: String.t()
  def to_string(%Matrix{data: data, rows: rows}) do
    last = (length(data) - 1)
    for index <- 0..last, into: "" do
      num = Enum.at(data, index)
      cond do
        index == last -> "#{num}"
        rem(index + 1, rows) == 0 -> "#{num}\n"
        true -> "#{num} "
      end
    end
  end

  @spec rows(matrix :: %Matrix{}) :: list(list(integer))
  def rows(%Matrix{data: data, rows: rows}) do
    Enum.chunk_every(data, rows)
  end

  @spec row(matrix :: %Matrix{}, index :: integer) :: list(integer)
  def row(matrix = %Matrix{}, index) do
    matrix |> rows() |> Enum.at(index)
  end

  @spec columns(matrix :: %Matrix{}) :: list(list(integer))
  def columns(%Matrix{data: data, rows: rows, columns: columns}) do
    for i <- 0..(rows - 1) do
      for j <- 0..(columns - 1),
        do: Enum.at(data, ((j * columns) + i))
    end
  end

  @spec column(matrix :: %Matrix{}, index :: integer) :: list(integer)
  def column(matrix = %Matrix{}, index) do
    matrix |> columns() |> Enum.at(index)
  end
end
