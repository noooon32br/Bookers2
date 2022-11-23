class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def index
    @user = User.all
    @books = Book
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @users = User.all
    @book = Book.new
  end

  def create
    user = User.show(user_params)
    if @user.save
      redirect_to user_path(user.id)
    else
      render :new
    end
  end

   private
  def user_params
    params.require(:user).permit(:Introduction, :name, :image)
  end
end
