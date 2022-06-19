class BooksController < ApplicationController

  before_action :edit_prevent, {only: [:edit]}

  def index
    @books = Book.all
    @book_currentuser = current_user 
    @book_new  = Book.new
  end
  
  def create
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id
    if @book_new.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book_new.id)
    else
      @books = Book.all
      @book_currentuser = current_user 
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @book_new.user_id = Book.find(params[:id]).id
    # @user = User.find_by(id: @book.user_id) 下記文と同じ内容
    @user = @book.user
  end
  
  def edit_prevent
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to books_path
    end
  end
  
  def edit
    @book = Book.find(params[:id]) # URLの:idを持ってくる
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice] = "Book was successfully destroyed."
      redirect_to books_path
    else
      redirect_to books_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end