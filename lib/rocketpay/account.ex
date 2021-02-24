defmodule Rocketpay.Account do
  use Ecto.Schema

  alias Ecto.Changeset
  alias Rocketpay.User

  # primary_key é uma variável de módulo
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:balance, :user_id]

  schema "accounts" do
    field :balance, :decimal
    belongs_to :user, User

    timestamps()
  end

  def changeset(params) do
    # struct vazia
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> check_constraint(:balance, :balance_must_be_positive_or_zero)
  end
end
