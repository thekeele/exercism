defmodule RobotSimulator do

  @valid_directions [:north, :east, :south, :west]

  @enforce_keys [:direction, :position]
  defstruct [:direction, :position]
  @type t :: %__MODULE__{direction: atom, position: {integer, integer}}

  @spec create(direction :: atom, position :: {integer, integer}) :: __MODULE__.t
  def create(direction \\ :north, position \\ {0, 0})

  def create(direction, position = {x, y})
      when is_integer(x) and is_integer(y) do
    if direction in @valid_directions do
      %__MODULE__{direction: direction, position: position}
    else
      {:error, "invalid direction"}
    end
  end

  def create(_, _), do: {:error, "invalid position"}

  @spec simulate(robot :: __MODULE__.t, instructions :: String.t()) :: __MODULE__.t
  def simulate(robot, instructions) do
    steps = String.codepoints(instructions)

    if Enum.all?(steps, & &1 in ["R", "L", "A"]) do
      do_simulate(robot, steps)
    else
      {:error, "invalid instruction"}
    end
  end

  defp do_simulate(robot, []),
    do: robot

  defp do_simulate(robot, [step | steps]) when step in ["R", "L"],
    do: robot |> change_direction(step, robot.direction) |> do_simulate(steps)

  defp do_simulate(robot, ["A" | steps]),
    do: robot |> change_position(robot.direction, robot.position) |> do_simulate(steps)

  defp change_direction(robot, "R", :north), do: %__MODULE__{robot | direction: :east}
  defp change_direction(robot, "R", :east), do: %__MODULE__{robot | direction: :south}
  defp change_direction(robot, "R", :south), do: %__MODULE__{robot | direction: :west}
  defp change_direction(robot, "R", :west), do: %__MODULE__{robot | direction: :north}
  defp change_direction(robot, "L", :north), do: %__MODULE__{robot | direction: :west}
  defp change_direction(robot, "L", :east), do: %__MODULE__{robot | direction: :north}
  defp change_direction(robot, "L", :south), do: %__MODULE__{robot | direction: :east}
  defp change_direction(robot, "L", :west), do: %__MODULE__{robot | direction: :south}

  defp change_position(robot, :north, {x, y}), do: %__MODULE__{robot | position: {x, y + 1}}
  defp change_position(robot, :east, {x, y}), do: %__MODULE__{robot | position: {x + 1, y}}
  defp change_position(robot, :south, {x, y}), do: %__MODULE__{robot | position: {x, y - 1}}
  defp change_position(robot, :west, {x, y}), do: %__MODULE__{robot | position: {x - 1, y}}

  @spec direction(robot :: __MODULE__.t) :: atom
  def direction(robot), do: robot.direction

  @spec position(robot :: __MODULE__.t) :: {integer, integer}
  def position(robot), do: robot.position
end
