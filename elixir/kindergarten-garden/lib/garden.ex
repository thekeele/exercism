defmodule Garden do
  @students [
    :alice, :bob, :charlie, :david, :eve, :fred, :ginny, :harriet, :ileana, :joseph, :kincaid, :larry
  ]

  @plant_codes %{"G" => :grass, "C" => :clover, "R" => :radishes, "V" => :violets}

  @spec info(String.t(), list) :: map
  def info(info_string, student_names \\ @students) do
    students_plants = Enum.into(student_names, %{}, &{&1, {}})

    process_windows(students_plants, Map.keys(students_plants), String.split(info_string, "\n"))
  end

  defp process_windows(students_plants, _, ["", ""]), do: students_plants

  defp process_windows(
       students_plants,
       [student_name | students],
       [
        <<row_one::binary-size(2), rest_row_one::binary()>>,
        <<row_two::binary-size(2), rest_row_two::binary()>>
       ]) do
    students_plants = %{students_plants | student_name => to_plant_names(row_one <> row_two)}
    process_windows(students_plants, students, [rest_row_one, rest_row_two])
  end

  defp to_plant_names(plant_codes) do
    plant_codes |> String.codepoints() |> Enum.map(&@plant_codes[&1]) |> List.to_tuple()
  end
end
