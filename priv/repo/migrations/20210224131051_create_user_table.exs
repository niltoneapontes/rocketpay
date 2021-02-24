defmodule Rocketpay.Repo.Migrations.CreateUserTable do
  use Ecto.Migration

  def change do
    create table :users do
      add :name, :string
      add :age, :integer
      add :email, :string
      add :password_hash, :string
      add :nickname, :string

      timestamps() #adiciona inserted_at e updated_at
    end

    create unique_index(:users, [:email]) # faz com que e-mail seja único
    create unique_index(:users, [:nickname]) # faz com que nickname seja único
  end
end
