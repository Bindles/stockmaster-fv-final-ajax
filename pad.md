rails routes lets you see all routes:

14-30 favicon error:

    <!-- For third-generation iPad with high-resolution Retina display: -->
    <!-- Size should be 144 x 144 pixels -->
    <%= favicon_link_tag 'apple-touch-icon-144x144-precomposed.png', :rel => 'apple-touch-icon-precomposed', :type => 'image/png', :sizes => '144x144' %>

    <!-- For iPhone with high-resolution Retina display: -->
    <!-- Size should be 114 x 114 pixels -->
    <%= favicon_link_tag 'apple-touch-icon-114x114-precomposed.png', :rel => 'apple-touch-icon-precomposed', :type => 'image/png', :sizes => '114x114' %>

    <!-- For first- and second-generation iPad: -->
    <!-- Size should be 72 x 72 pixels -->
    <%= favicon_link_tag 'apple-touch-icon-72x72-precomposed.png', :rel => 'apple-touch-icon-precomposed', :type => 'image/png', :sizes => '72x72' %>

    <!-- For non-Retina iPhone, iPod Touch, and Android 2.1+ devices: -->
    <!-- Size should be 57 x 57 pixels -->
    <%= favicon_link_tag 'apple-touch-icon-precomposed.png', :rel => 'apple-touch-icon-precomposed', :type => 'image/png' %>

    <!-- For all other devices -->
    <!-- Size should be 32 x 32 pixels -->
    <%= favicon_link_tag 'favicon.ico', :rel => 'shortcut icon' %>

# Steps

# Video 1(3) Devise and Bootstrap

gem 'twitter-bootstrap-rails', '~> 5.0'
gem 'jquery-rails'
bundle i
rails generate bootstrap:install static
rails g bootstrap:layout application

gem 'devise-bootstrap-views'
bundle install
rails g devise:views:locale en
rails g devise:views:bootstrap_templates

# Video 2 (5?):

rails g model Stock ticker:string name:string last_price:decimal
rails db:migrate
rails c
StockQuote::Stock.quote("bac")
routes.rb >> get 'my_portfolio', to: 'users#my_portfolio'
code -r app/controllers/users_controller.rb
Class UsersController < ApplicationController
def my_portfolio

end
end
code -r app/views/users/my_portfolio.html.erb:

<h1>My Portfolio</h1>

# ignore: @stocks = StockQuote::Stock.quote("bac")

# Video 3 (6):

rails g scaffold Stock ticker:string name:string last_price:decimal
rails db:migrate
rails c
StockQuote::Stock.quote("bac")
routes.rb >> get 'my_portfolio', to: 'users#my_portfolio'
code -r app/controllers/users_controller.rb
Class UsersController < ApplicationController

# Ignore above:

my_portfolio.html.erb >> html

-build form
-routes -> search-stocks
-controller -> action - stocks_controller.rb search stocks

    def search
        #StockQuote::Stock.quote('bac')
        Stock.new_from_lookup(params[:stock])
        render json: @stock
    end


        Stock.new_from_lookup(params[:stock])
        render json: @stock



    def self.new_from_lookup(ticker_symbol)
        looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
        new(name: looked_up_stock.name, ticker: looked_up_stock.symbol, last_price: looked_up_stock.l)
    end

stock.rb
class Stock < ApplicationRecord

end

gpt tstocks_controller:

# app/controllers/stocks_controller.rb

class TstocksController < ApplicationController
def mystocks
stock_new_output = StockQuote::Stock.new(api_key: "sk_abbe07f159d242c5b78454e3e74386ed")
stock_quote_output = StockQuote::Stock.quote('bac')

    @output = {
      stock_new: stock_new_output,
      stock_quote: stock_quote_output
    }

end
end

        #StockQuote::Stock.new(api_key: sk_abbe07f159d242c5b78454e3e74386ed)


                <button type="button" class="btn btn-info">Search</button>
                <button type="reset" class="btn btn-default">Reset</button>
                <%= button_to 'Lookup a Stock', path: "#", class: "btn btn-danger" %>
                <%= button_to "Destroy this post", class: '' %>
                <%= button_to "Add Pictures", class: "btn btn-small btn-success" %>

class Stock < ApplicationRecord  
 IEX_API_KEY = 'sk_abbe07f159d242c5b78454e3e74386ed'

def self.new_from_lookup(ticker_symbol)
looked_up_stock = StockQuote::Stock.new(api_key: IEX_API_KEY).quote(ticker_symbol)
new(name: looked_up_stock.company_name, ticker: looked_up_stock.symbol, last_price: looked_up_stock.latest_price)
end
end

# stock.rb (8.28) -> BEFORE FIX UNKNOWN SYMBOL

class Stock < ApplicationRecord  
 IEX_API_KEY = 'sk_abbe07f159d242c5b78454e3e74386ed'

def self.new_from_lookup(ticker_symbol)
looked_up_stock = StockQuote::Stock.new(api_key: IEX_API_KEY)
looked_up_stock = StockQuote::Stock.quote(ticker_symbol, api_key: IEX_API_KEY)
new(name: looked_up_stock.company_name, ticker: looked_up_stock.symbol, last_price: looked_up_stock.latest_price)
end
end
