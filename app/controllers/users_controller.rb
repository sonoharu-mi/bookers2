class UsersController < ApplicationController
  
  def index
    @users = User.all
    @book = Book.new
    @books = Book.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def edit
  end
end
