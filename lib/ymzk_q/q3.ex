defmodule YmzkQ.Q3 do
  def fetch_twitter_ogp(html) when is_binary(html) do
    html
    |> Floki.parse_document()
    |> fetch_twitter_ogp()
  end

  def fetch_twitter_ogp({:ok, [{"html", _, _}] = doc}) do
    doc
    |> Floki.find("meta")
    |> Enum.map(fn d -> {Floki.attribute(d, "name"), Floki.attribute(d, "content")} end)
    |> Enum.map(&convert_twitter_meta/1)
    |> Enum.filter(fn v -> v != nil end)
    |> Enum.reduce(%{}, fn {name, content}, prev -> Map.put(prev, name, content) end)
  end

  def fetch_twitter_ogp(_) do
    :error
  end

  defp convert_twitter_meta({["twitter:" <> name], [content]}) when is_binary(content),
    do: {name, content}

  defp convert_twitter_meta(_), do: nil
end

# #3 参考回答

# おおまかな流れはFloki.parse_document/1とFloki.find/2を使って取得したmetaタグのHTMLノード情報を整形する処理となります。
# convert_twitter_meta/1では引数のパターンマッチングとバイナリパターンマッチングを駆使し、今回のIssueの要件に合うように情報を整形します。対象外であろうname属性を持つmetaタグは一度nilを返し、後々Enum.filter/2でフィルタリングします。
