defmodule Rocketpay.Numbers do
  def sum_from_file(filename) do
    "#{filename}.csv"
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok, result}) do
    result =
      result
      |> String.split(",")
      # utilizamos o Stream para só executar a conversão quando necessário
      |> Stream.map(fn number -> String.to_integer(number) end)
      # o Enum irá executar obrigatoriamente e chamar o Stream anterior (estão no mesmo pipe)
      |> Enum.sum()

    {:ok, %{result: result}}
  end

  defp handle_file({:error, _reason}), do: {:error, %{message: "Invalid filename"}}
end
