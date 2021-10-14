defmodule YmzkQ.Q2Test do
  use ExUnit.Case
  alias YmzkQ.Q2

  test "hey/1" do
    valids = [
      {[5, 6, 7, 8, 9, 10], "おはよう"},
      {[11, 12, 13, 14, 15, 16, 17, 18], "こんにちは"},
      {[19, 20, 21, 22, 23, 0, 1, 2, 3, 4], "こんばんは"}
    ]

    valids
    |> Enum.map(fn {hs, str} -> Enum.map(hs, fn h -> {h, str} end) end)
    |> List.flatten()
    |> Enum.each(fn {h, str} ->
      mock_h = Time.new!(h, 0, 0)
      assert Q2.hey(mock_h) == str
    end)

    assert Q2.hey(nil) == :error
  end
end
