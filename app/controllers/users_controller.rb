class UsersController < ApplicationController
  def my_portfolio

    @user = current_user
    @tracked_stocks = @user.stocks
  end

  def my_friends
    @friends = current_user.friend
  end
  
  def search
    render json: params[:friend] 
  end
  
end

