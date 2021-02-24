defmodule Rocketpay.Accounts.Deposit do
  alias Ecto.Multi

  alias Rocketpay.{Accounts, Repo}

  def call(%{"id" => id} = params) do
    Multi.new()
    |>Multi.run(:account, fn repo, _changes -> )
  end
end
