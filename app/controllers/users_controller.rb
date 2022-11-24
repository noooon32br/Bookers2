class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @users = User.all
    @book = Book.new

  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

   private
  def user_params
    params.require(:user).permit(:Introduction, :name, :image)
  end
end
