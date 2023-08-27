class StocksController < ApplicationController   
    def search
        @stock = Stock.new_from_lookup(params[:stock])
        puts @stock.inspect
        render json: @stock
    end
end
