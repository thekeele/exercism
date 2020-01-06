defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(x, y, z) when x <= 0 or y <= 0 or z <= 0,
    do: {:error, "all side lengths must be positive"}

  def kind(x, y, z) when (x + y <= z) or (y + z <= x) or (z + x <= y),
    do: {:error, "side lengths violate triangle inequality"}

  def kind(x, y, z) when x === y and y === z,
    do: {:ok, :equilateral}

  def kind(x, y, z) when x === y or y === z or z === x,
    do: {:ok, :isosceles}

  def kind(x, y, z) when x !== y and y !== z,
    do: {:ok, :scalene}
end
