defmodule Mix.Tasks.YmzkQ.Q2 do
    @moduledoc "The YmzkQ.Q2 mix task: `mix help q2`"
    use Mix.Task
  
    @shortdoc "Simply calls the YmzkQ.Q2.hey/0 function."
    def run(_) do
      # calling our Hello.say() function from earlier
      YmzkQ.Q2.hey()
    end
end