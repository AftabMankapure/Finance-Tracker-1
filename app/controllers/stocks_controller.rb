class StocksController < ApplicationController
    respond_to :html, :json

    def search
        if params[:stock].present?
          @stock = Stock.new_lookup(params[:stock])
          if @stock
            render 'users/my_portfolio'
          else
            flash.now[:alert] = "Please enter a valid symbol to search"
            redirect_to my_portfolio_path
          end    
        else
          flash.now[:alert] = "Please enter a symbol to search"
          redirect_to my_portfolio_path
        end
    end
    
    
end


