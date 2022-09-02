defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    do_extract(data, String.split(path, "."))
  end

  defp do_extract(nil, _keys), do: nil

  defp do_extract(data, [key | []]), do: data[key]

  defp do_extract(data, [key | keys]), do: do_extract(data[key], keys)

  def get_in_path(data, path) do
    get_in(data, String.split(path, "."))
  end
end
