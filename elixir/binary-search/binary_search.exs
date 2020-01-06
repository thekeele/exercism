defmodule BinarySearch do

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _), do: :not_found
  def search(numbers, key) do
    numbers = Tuple.to_list(numbers)

    binary_search(numbers, key, 0, length(numbers))
  end

  defp binary_search(_, _, low, high) when low > high, do: :not_found
  defp binary_search(numbers, key, low, high) do
    middle = floor((low + high) / 2)
    current = Enum.at(numbers, middle)

    cond do
      current < key -> binary_search(numbers, key, middle + 1, high)
      current > key -> binary_search(numbers, key, low, middle - 1)
      true -> {:ok, middle}
    end
  end
end
