defmodule Gigasecond do

  @gigasecond 1_000_000_000

  @spec from({{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}) ::
          :calendar.datetime()

  def from({{_, _, _}, {_, _, _}} = erl_datetime) do
    erl_datetime
    |> :calendar.datetime_to_gregorian_seconds()
    |> Kernel.+(@gigasecond)
    |> :calendar.gregorian_seconds_to_datetime()
  end
end
