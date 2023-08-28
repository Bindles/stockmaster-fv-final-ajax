class UsersController < ApplicationController
  def my_portfolio
    @stock = nil
    if params[:stock].present?
      @stock = Stock.new_from_lookup(params[:stock])
    end
  end
end