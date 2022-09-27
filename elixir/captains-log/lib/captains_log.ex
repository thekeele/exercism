defmodule CaptainsLog do
  @planetary_classes ["D", "H", "J", "K", "L", "M", "N", "R", "T", "Y"]

  def random_planet_class(), do: Enum.random(@planetary_classes)

  def random_ship_registry_number(), do: "NCC-#{Enum.random(1000..9999)}"

  def random_stardate() do
    :rand.uniform() * (42000 - 1 - 41000) + 41000
  end

  def format_stardate(stardate) do
    "~.1f" |> :io_lib.format([stardate]) |> to_string()
  end
end
