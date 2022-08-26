defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name
    |> String.trim()
    |> String.slice(0, 1)
  end

  def initial(name) do
    name
    |> first_letter()
    |> String.upcase
    |> Kernel.<>(".")
  end

  def initials(full_name) do
    [first, last] = String.split(full_name, " ", parts: 2)

    initial(first) <> " " <> initial(last)
  end

  def pair(full_name1, full_name2) do
    p1 = initials(full_name1)
    p2 = initials(full_name2)

    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{p1}  +  #{p2}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end
