class BooksController < ApplicationController
  def index
    @book = Book.new
  end

   def create
    @book = Book.new(book.params)
    @book.user_id = current_user.id

    if  @book.save
    redirect_to books_path
    else
     render :new
    end
   end

  def show
    @book = Book.all
  end

  def edit
     @book = Book.all
  end


  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@user.id)
  end


  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end

end
