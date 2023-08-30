# stock.rb

class StocksController < ApplicationController  
 def search
@stock = Stock.new_from_lookup(params[:stock])
#puts @stock.inspect
#ender json: @stock
#render 'users/my_portfolio'
respond_to do |format|
format.js { render 'users/result' }
end
end
end

# users/my_portfolio.html.erb

<h1>Portfolio</h1>

<h3>Search for Stocks</h3>
<div class="id">stock-lookup
    <%= form_tag "search_stocks", remote: true, method: :get, id: "stock-lookup-form" do %>
        <div class="form-group row no-padding text-center col-md-12">
            <div class="col-md-12">
                <%= text_field_tag :stock, params[:stock], placeholder: "Stock ticker symbol", autofocus: true, class: "form-control search-box input-lg", required: true %>

            </div>
            <div class="col-md-2">

                <%= button_to 'Lookup a Stock', path: "#", class: "btn btn-danger" %>

                <%= button_tag( type: :submit, path: "#", class: "btn btn-lg btn btn-info") do %>
                <i class="fa fa-search"></i>Look up a stock
                <% end %>
            </div>
        </div>
    <% end %>

</div>

<div class="results">
    <%= render 'users/result' %>
</div>

# code -r app/views/users/\_result.html.erb

<% if @stock %>

  <div class="well results-block">
    <strong>Stock Name:</strong> <%= @stock.name %>
    <strong>Ticker Symbol:</strong> <%= @stock.ticker %>
    <strong>Last Price:</strong> <%= @stock.last_price %>
  </div>
<% elsif params[:stock].present? %>
    <% flash.now[:danger] = "No stock data found for the provided symbol." %>
<% end %>

# code -r app/views/users/\_result.js

$("#results").html("<%= j (render 'users/result.html') %>");
