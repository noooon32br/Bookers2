class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(@user.id)
    end
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
    @user.user_id = current_user.id
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :index
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

   private
   
  def currect_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end
   
   
  def user_params
    params.require(:user).permit(:Introduction, :name, :image)
  end
end
