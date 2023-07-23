
class UserStocksController < ApplicationController
  before_action :set_user_stock, only: [:destroy]

  def create
    stock = Stock.check_db(params[:ticker])
    if stock.blank?
      stock = Stock.new_lookup(params[:ticker])
      stock.save
    end

    # Check if the stock is present and its ID is not nil
      # @user_stock = UserStock.create(user: current_user, stock_id: stock.id)
      @user_stock = UserStock.create(user: current_user, stock: stock)
      flash[:notice] = "Stock #{stock.name} was successfully added to your portfolio"
      redirect_to my_portfolio_path
   
  end

  # def destroy
  #   @user_stock.destroy(@user_stock[0].id)
  #   respond_to do |format|
  #     format.html { redirect_to my_portfolio_path, notice: 'Stock was successfully removed from portfolio.' }
  #     format.json { head :no_content }
  #   end
  # end

  def destroy
    @user_stock = UserStock.find(params[:id])
    @user_stock.destroy
    redirect_to my_portfolio_path, notice: 'Stock was successfully removed from portfolio.'
  end
 
 private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_stock
      @user_stock = UserStock.where("stock_id = ? and user_id = ?",params[:id],current_user.id)
    end

end
