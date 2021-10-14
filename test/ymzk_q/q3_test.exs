defmodule YmzkQ.Q3Test do
  use ExUnit.Case
  alias YmzkQ.Q3

  test "fetch_twitter_ogp/1" do
    html = """
    <html>
      <head>
        <meta name="twitter:card" content="summary"></meta>
        <meta name="twitter:site" content="utsuke_jp"></meta>
        <meta name="invalid" content="dummy"></meta>
      </head>
      <body>
        <h1>Hello</h1>
      </body>
    </html>
    """

    result = Q3.fetch_twitter_ogp(html)
    invalid_result = Q3.fetch_twitter_ogp("invalid")
    assert result["card"] == "summary"
    assert result["site"] == "utsuke_jp"
    assert invalid_result == :error
  end
end
