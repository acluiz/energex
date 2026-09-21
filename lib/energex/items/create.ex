defmodule Energex.Items.Create do
  alias Energex.{Item, Repo} # alias Energex.Item and alias Energex.Repo

  def call(params) do
    params
    |> Item.changeset()
    |> Repo.insert()
  end
end
