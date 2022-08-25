defmodule KitchenCalculator do
  def get_volume({_unit, volume}), do: volume

  def to_milliliter({:milliliter, volume}), do: {:milliliter, volume}
  def to_milliliter({:cup, volume}), do: {:milliliter, volume * 240.0}
  def to_milliliter({:fluid_ounce, volume}), do: {:milliliter, volume * 30.0}
  def to_milliliter({:teaspoon, volume}), do: {:milliliter, volume * 5.0}
  def to_milliliter({:tablespoon, volume}), do: {:milliliter, volume * 15.0}

  def from_milliliter({_milliliter, milliliters}, :milliliter),
    do: {:milliliter, milliliters}

  def from_milliliter({_milliliter, milliliters}, :cup),
    do: {:cup, milliliters / 240.0}

  def from_milliliter({_milliliter, milliliters}, :fluid_ounce),
    do: {:fluid_ounce, milliliters / 30.0}

  def from_milliliter({_milliliter, milliliters}, :teaspoon),
    do: {:teaspoon, milliliters / 5.0}

  def from_milliliter({_milliliter, milliliters}, :tablespoon),
    do: {:tablespoon, milliliters / 15.0}

  def convert(volume_tuple, to_unit),
    do: volume_tuple |> to_milliliter() |> from_milliliter(to_unit)
end
