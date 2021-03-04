defmodule Ecommerce do
  use Application

  def getSalesProductDataShopee do

    url = "https://shopee.vn/api/v2/search_items/?by=sales&limit=6&match_id=88201679&newest=0&order=desc&page_type=shop&version=2"
    callAPI(url)

  end

  def getBestSellingProductDataShopee do

    url = "https://shopee.vn/api/v2/search_items/?by=relevancy&limit=6&match_id=88201679&newest=0&order=desc&page_type=shop&shop_categoryids=44525007&version=2"
    callAPI(url)

  end

  def getNewestProductDataShopee do

    url = "https://shopee.vn/api/v2/search_items/?by=relevancy&limit=6&match_id=88201679&newest=0&order=desc&page_type=shop&shop_categoryids=45109268&version=2"
    callAPI(url)

  end

  def getPopProductDataShopee do

    url = "https://shopee.vn/api/v2/search_items/?by=pop&limit=30&match_id=88201679&newest=0&order=desc&page_type=shop&version=2"
    callAPI(url)

  end

  defp callAPI(url) do
    headers =  [{"User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36"},
                {"X-Requested-With", "XMLHttpRequest"},
              {"Referer", "https://shopee.vn/apple_flagship_store"}]

    case HTTPoison.get(url, headers) do
    {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
      body
    {:ok, %HTTPoison.Response{status_code: 404}} ->
      IO.puts "Not found :("
    {:error, %HTTPoison.Error{reason: reason}} ->
      IO.inspect reason
end

  end

  def start(_type, _args) do
    children = [
      Plug.Adapters.Cowboy.child_spec(:http, Ecommerce.Router, [], [port: 4001])
    ]
    Supervisor.start_link(children, strategy: :one_for_one)

  end
end
