class StocksController < ApplicationController   
    def search
        @stock = Stock.new_from_lookup(params[:stock])
        #puts @stock.inspect
        #ender json: @stock
        render 'users/my_portfolio'
    end
end
