class UsersController < ApplicationController
  
  def index
    @book = Book.new
    @users = User.all
    @books = Book.all
    @user = User.find(current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @book_new = Book.new
    @books = @user.books.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully"
      redirect_to user_path(@user.id)
    else
      flash.now[:alert] = "Update failed to error"
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def is_matcing_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end
end
