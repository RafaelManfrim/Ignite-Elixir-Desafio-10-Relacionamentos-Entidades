defmodule Exmeal.User do
  use Ecto.Schema
  alias Exmeal.Meal
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [ :id, :name, :cpf, :email]}

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:cpf, :email, :name]

  schema "users" do
    field :name, :string
    field :email, :string
    field :cpf, :string

    has_many :meals, Meal

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
