class Stock < ApplicationRecord  
  IEX_API_KEY = 'sk_abbe07f159d242c5b78454e3e74386ed'

  def self.new_from_lookup(ticker_symbol)
    looked_up_stock = StockQuote::Stock.quote(ticker_symbol, api_key: IEX_API_KEY)
    new(name: looked_up_stock.company_name, ticker: looked_up_stock.symbol, last_price: looked_up_stock.latest_price)
  end
end

