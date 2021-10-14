use Mix.Config

config :logger, level: :debug

config :ymzk_q, YmzkQ.Scheduler,
  jobs: [
    {{:extended, "* * * * *"}, {YmzkQ.Q1, :create_message, ["a"]}},
    {{:extended, "* * * * *"}, {YmzkQ.Q2, :hey, []}}
    # {"05 15 * * *", {YmzkQ.Q2, :hey, []}}
  ]