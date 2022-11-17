class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books 
  end
  
   private
  def user_params
    params.require(:user).permit(:Introduction, :name, :image)  
  end
end
