class StocksController < ApplicationController   
    def search
        Stock.new_from_lookup(params[:stock])
        render json: @stock
    end
end
