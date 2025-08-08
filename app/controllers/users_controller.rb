class UsersController < ApplicationController
  
  def index
    @book = Book.new
    @books = @user.books.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @book_new = Book.new
    @books = @user.books.page(params[:page])
  end

  def edit
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
