defmodule Mix.Tasks.Sample do
  use Mix.Task

  @shortdoc "My mix command sample"

  def run(args) do
      IO.puts (inspect args)
  end
end