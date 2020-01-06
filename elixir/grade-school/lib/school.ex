defmodule School do
  @spec add(map, String.t(), integer) :: map
  def add(db, name, grade) do
    Map.update(db, grade, [name], fn students -> [name | students] end)
  end

  @spec grade(map, integer) :: [String.t()]
  def grade(db, grade) do
    db[grade] || []
  end

  @spec sort(map) :: [{integer, [String.t()]}]
  def sort(db) do
    Enum.map(db, fn {k, v} -> {k, Enum.sort(v)} end)
  end
end
