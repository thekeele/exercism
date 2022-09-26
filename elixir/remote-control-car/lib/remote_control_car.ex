defmodule RemoteControlCar do
  @enforce_keys [:battery_percentage, :distance_driven_in_meters, :nickname]
  defstruct [:battery_percentage, :distance_driven_in_meters, :nickname]

  def new(nickname \\ "none") do
    %__MODULE__{
      battery_percentage: 100,
      distance_driven_in_meters: 0,
      nickname: nickname
    }
  end

  def display_distance(%__MODULE__{distance_driven_in_meters: distance_driven_in_meters}),
    do: "#{distance_driven_in_meters} meters"

  def display_battery(%__MODULE__{battery_percentage: 0}),
    do: "Battery empty"

  def display_battery(%__MODULE__{battery_percentage: battery_percentage}),
    do: "Battery at #{battery_percentage}%"

  def drive(%__MODULE__{battery_percentage: 0} = remote_car),
    do: remote_car

  def drive(%__MODULE__{} = remote_car) do
    %{
      remote_car
      | battery_percentage: remote_car.battery_percentage - 1,
        distance_driven_in_meters: remote_car.distance_driven_in_meters + 20
    }
  end
end
