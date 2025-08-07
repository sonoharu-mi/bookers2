class UsersController < ApplicationController
  
  def index
    @book = Book.new
    @books = Book.all
    @book = @user.books
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def edit
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
end
