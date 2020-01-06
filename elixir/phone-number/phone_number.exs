defmodule Phone do
  @spec number(String.t()) :: String.t()
  def number(<<"+1 ">> <> nanp_number) do
    number(nanp_number)
  end
  def number(<<"1">> <> nanp_number) do
    number(nanp_number)
  end
  def number(<<"(", area_code::binary-size(3), ") ",
               exchange_code::binary-size(3), "-",
               subscriber_code::binary-size(4)>>) do
    number(area_code <> exchange_code <> subscriber_code)
  end
  def number(<<area_code::binary-size(3), ".",
               exchange_code::binary-size(3), ".",
               subscriber_code::binary-size(4)>>) do
    number(area_code <> exchange_code <> subscriber_code)
  end
  def number(<<"0", _::binary-size(9)>>) do
    "0000000000"
  end
  def number(<<_::binary-size(3), "0", _::binary-size(6)>>) do
    "0000000000"
  end
  def number(<<_::binary-size(3), "1", _::binary-size(6)>>) do
    "0000000000"
  end
  def number(<<nanp_number::binary-size(10)>>) do
    case Integer.parse(nanp_number) do
      {_, ""} -> nanp_number
      _ -> "0000000000"
    end
  end
  def number(_) do
    "0000000000"
  end

  @spec area_code(String.t()) :: String.t()
  def area_code(raw) do
    <<area_code::binary-size(3), _::binary-size(7)>> = number(raw)
    area_code
  end

  @spec pretty(String.t()) :: String.t()
  def pretty(raw) do
    <<ac::binary-size(3), ec::binary-size(3), sc::binary-size(4)>> = number(raw)
    "(#{ac}) #{ec}-#{sc}"
  end
end
