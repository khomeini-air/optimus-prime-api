defmodule Params.Prime.Paging do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field(:n, :integer)
    field(:limit, :integer)
    field(:offset, :integer)
  end

  def changeset(param) do
    %__MODULE__{}
    |> cast(param, [:n, :limit, :offset])
    |> validate_required([:n, :limit, :offset])
    |> validate_number(:n, greater_than: 0)
    |> validate_number(:limit, greater_than_or_equal_to: 0)
    |> validate_number(:offset, greater_than: 0, less_than: 100)
  end
end
