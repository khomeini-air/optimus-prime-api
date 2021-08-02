defmodule Params.Prime do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field(:n, :integer)
  end

  def changeset(param) do
    %__MODULE__{}
    |> cast(param, [:n])
    |> validate_required([:n])
    |> validate_number(:n, greater_than: 0)
  end
end
