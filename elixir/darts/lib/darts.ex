defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    distance_from_center = :math.sqrt(x*x + y*y)

    cond do
      inner?(distance_from_center) -> 10
      middle?(distance_from_center) -> 5
      outer?(distance_from_center) -> 1
      true -> 0
    end
  end

  defp inner?(distance), do: 1 >= distance and distance >= 0
  defp middle?(distance), do: 5 >= distance and distance > 1
  defp outer?(distance), do: 10 >= distance and distance > 5
end
