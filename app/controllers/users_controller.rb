class UsersController < ApplicationController
  
  before_action :edit_prevent, {only: [:edit]}
  
  def index
    @users = User.all
    # @user_new  = User.new 何故作ったか分からない？いらないはず。
    @user_currentuser  = current_user
    @book_new = Book.new
  end
  
  def show
    @user = User.find(params[:id])
    @user_new = User.new
    @books = @user.books
    @book_new = Book.new
  end
  
  def edit_prevent
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end
