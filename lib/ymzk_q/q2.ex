defmodule YmzkQ.Q2 do
  # TODO: implement hey

  def hey() do
    hey(Time.utc_now())
  end

  def hey(%Time{} = t) do
    cond do
      t.hour >= 5 and t.hour < 11 -> IO.puts("おはよう")
      t.hour >= 11 and t.hour < 19 -> IO.puts("こんにちは")
      true -> IO.puts("こんばんは")
    end
  end

  def hey(_) do
    :error
  end
end

# #2 参考回答

# 現在時刻などを使う関数に関して、テストしやすい設計を意識すると現在時刻の発行を関数内部に閉じ込めるのは悪手です。
# hey/1の引数としてTimeストラクトを受け取るようにします。 hey/0 は引数を受け取らなかった場合、Time.utc_now/0 で現在時刻を発行しhey/1に渡す設計になっていて、アプリケーションのコードでは主にこちらを使用します。
# hey/0 は Time.utc_now/0とhey/1が正常に動作することが担保されれば正常に動作すると言えるので、落とし所としてはこれでちょうど良いでしょう。