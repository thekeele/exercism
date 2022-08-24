defmodule Lasagna do
  def expected_minutes_in_oven(),
    do: 40

  def remaining_minutes_in_oven(remaining_minutes),
    do: expected_minutes_in_oven() - remaining_minutes

  def preparation_time_in_minutes(number_of_layers),
    do: number_of_layers * 2

  def total_time_in_minutes(number_of_layers, number_of_minutes),
    do: preparation_time_in_minutes(number_of_layers) + number_of_minutes

  def alarm(),
    do: "Ding!"
end
