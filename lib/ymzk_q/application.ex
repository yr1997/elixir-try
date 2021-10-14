defmodule YmzkQ.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      YmzkQ.Scheduler
    ]

    opts = [strategy: :one_for_one, name: YmzkQ.Supervisor]
    Supervisor.start_link(children, opts)
  end
end