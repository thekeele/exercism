defmodule NameBadge do
  def print(id, name, department) do
    ""
    |> then(fn badge ->
      if id, do: "[#{id}] - " <> badge, else: badge
    end)
    |> then(fn badge ->
      badge <> "#{name} - "
    end)
    |> then(fn badge ->
      if department, do: badge <> "#{String.upcase(department)}", else: badge <> "OWNER"
    end)
  end
end
