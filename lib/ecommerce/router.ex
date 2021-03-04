defmodule Ecommerce.Router do
  use Plug.Router

  plug Plug.Parsers,  parsers: [:json],
                      pass: ["text/*"],
                      json_decoder: Jason

  plug :match
  plug :dispatch

  get "/" do
    render(conn, "index.html")
  end

  get "/data" do
    salesProds = Ecommerce.getSalesProductDataShopee()
    bestSellingProds = Ecommerce.getBestSellingProductDataShopee()
    newestProds = Ecommerce.getNewestProductDataShopee()
    popProducts = Ecommerce.getPopProductDataShopee()

    salesProdsObj = Jason.decode!(salesProds, [])
    bestSellingProdsObj = Jason.decode!(bestSellingProds, [])
    newestProdsObj = Jason.decode!(newestProds, [])
    popProductsObj = Jason.decode!(popProducts, [])

    res = %{salesProdItems: salesProdsObj["items"], bestSellingProdItems: bestSellingProdsObj["items"],
     newestProdItems: newestProdsObj["items"], popProductItems: popProductsObj["items"]}
    render_json(conn, res)
  end

  match _ do
    send_resp(conn, 404, "404!")
  end

  defp render(%{status: status} = conn, template, assigns \\ []) do
    body =
      "lib/ecommerce/templates"
      |> Path.join(template)
      |> String.replace_suffix(".html", ".html.eex")
      |> EEx.eval_file(assigns)

    send_resp(conn, (status || 200), body)
  end

  defp render_json(%{status: status} = conn, data) do
    res = Jason.encode!(data, [])
    send_resp(conn, (status || 200), res)
  end
end
