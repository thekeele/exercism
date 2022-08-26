defmodule Username do
  @german_characters %{
    ?ä => [?a, ?e],
    ?ö => [?o, ?e],
    ?ü => [?u, ?e],
    ?ß => [?s, ?s]
  }

  @german_keys Map.keys(@german_characters)

  def sanitize([]), do: []

  def sanitize([character | rest]) do
    case character do
      character when character in @german_keys ->
        [@german_characters[character] | sanitize(rest)] |> List.flatten()

      character when character in ?a..?z or character == ?_ ->
        [character | sanitize(rest)]

      _character ->
        sanitize(rest)
    end
  end
end
