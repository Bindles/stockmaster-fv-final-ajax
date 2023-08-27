class TstocksController < ApplicationController
  def mystocks
    api_key = 'sk_abbe07f159d242c5b78454e3e74386ed'  # Replace with your actual API key
    stock_new_instance = StockQuote::Stock.new(api_key: api_key)
    stock_new_instance.send(:authenticated?)

    @output = {
      stock_new: "API Authenticated. Thank you for using IEX Cloud. iexcloud.io"
    }
  end
end
