defmodule YmzkQ.Q1 do
  def create_message(message) do
    case save_message(message) do
      :ok ->
        # 処理を別プロセスに移動
        Task.start(fn ->
          send_notification("Success :)")
        end)
        IO.puts(message)
        # :ok

      _ ->
        :error
    end
  end

  defp save_message(_message) do
    # NOTE: save_message/1の関数内部は試験内容に関係無いためダミー
    :ok
  end

  defp send_notification(notif) do
    # NOTE: send_notification/1の関数内部は試験内容に関係無いためダミー
    Process.sleep(3000)
    IO.puts(notif)
    # :ok
  end
end

# #1 参考回答

# 返される結果に関心がないような副作用を後回しにする場合、Task.start/1 を使用し、子プロセスに処理を移動します
# Task.start_link/1 はもしクラッシュした場合親プロセスもkillされてしまうため、今回はTask.start/1 を使用します
