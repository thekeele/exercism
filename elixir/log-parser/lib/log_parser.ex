defmodule LogParser do
  def valid_line?(line) do
    Regex.match?(~r/^\[(DEBUG|INFO|WARNING|ERROR)\]/, line)
  end

  def split_line(line) do
    Regex.split(~r/<(\*|~|-|=)*>/, line)
  end

  def remove_artifacts(line) do
    Regex.replace(~r/end-of-line\d+/i, line, "")
  end

  def tag_with_user_name(line) do
    case Regex.run(~r/User(\s|\\t)+[\w\p{So}!_]+(\s|\\t)*/u, line) do
      nil ->
        line

      ["User" <> name | _] ->
        "[USER] " <> "#{String.trim(name)} " <> line
    end
  end
end
