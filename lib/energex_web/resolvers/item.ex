defmodule EnergexWeb.Resolvers.Item do
  def get(%{id: item_id}, _context) do
    Energex.Items.Get.call(item_id)
  end
end
