defmodule EnergexWeb.Resolvers.Item do
  alias Energex.Items

  def get(%{id: item_id}, _context) do
    Items.Get.call(item_id)
  end

  def create(%{input: params}, _context) do
    Items.Create.call(params)
  end
end
