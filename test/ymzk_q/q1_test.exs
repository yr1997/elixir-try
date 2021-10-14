defmodule YmzkQ.Q1Test do
  use ExUnit.Case
  alias YmzkQ.Q1

  test "create_message/1" do
    assert :ok == Q1.create_message("Hello")
  end
end
