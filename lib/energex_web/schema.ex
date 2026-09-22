defmodule EnergexWeb.Schema do
  use Absinthe.Schema

  import_types EnergexWeb.Schema.Types.Root

  query do
    import_fields :root_query
  end
end
