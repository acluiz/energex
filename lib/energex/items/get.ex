defmodule Energex.Items.Get do
  alias Energex.{Item, Repo} # alias Energex.Item and alias Energex.Repo

  def call(id) do
    case Repo.get(Item, id) do
      nil -> {:error, "item not found"}
      item -> {:ok, item}
    end
  end
end
