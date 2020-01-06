defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(deep_list) :: list when deep_list: [any | deep_list]
  def flatten([]), do: []
  def flatten([nil | cdr]), do: flatten(cdr)
  def flatten([car | cdr]) when is_list(car), do: flatten(car ++ cdr)
  def flatten([car | cdr]) when is_integer(car), do: [car | flatten(cdr)]
end
