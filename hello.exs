Mix.install([
    {:httpoison, "~> 1.8"},
    {:jason, "~> 1.2"}
  ])
  
  "https://qiita.com/api/v2/items?query=tag:Elixir"
  |> HTTPoison.get!()
  |> Map.get(:body)
  |> Jason.decode!()
  |> Enum.map(& &1["title"])
  |> IO.inspect()