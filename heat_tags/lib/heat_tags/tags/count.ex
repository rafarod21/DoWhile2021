defmodule HeatTags.Tags.Count do
  alias HeatTags.Messages.Get

  def call() do
    Get.today_messages()
    # |> Task.async_stream(fn message -> count_word(message.message) end)
    |> Task.async_stream(&count_word(&1.message))
    |> Enum.reduce(%{}, fn elem, acc -> sum_values(elem, acc) end)
    |> IO.inspect()
  end

  defp count_word(message) do
    message
    |> String.split()
    |> Enum.frequencies()
  end

  defp sum_values({:ok, map1}, map2) do
    Map.merge(map1, map2, fn _key, value1, value2 -> value1 + value2 end)
  end

end
