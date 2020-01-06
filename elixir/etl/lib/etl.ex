defmodule ETL do
  @spec transform(map) :: map
  def transform(input) do
    Enum.reduce(input, %{}, fn {score, letters}, transformation ->
      Enum.into(letters, transformation, &{String.downcase(&1), score})
    end)
  end
end
