class BooksController < ApplicationController
  def top

  end

  def index
  	@book = Book.new
  	@books = Book.all
  end

  def show
  	@book = Book.find(params[:id])

  end

  def create
  	book = Book.new(book_params)
    if book.save
      flash[:notice]='book was succesfully created'
      redirect_to book_path(book.id)
    else
      render :index
    end
  end

  def new
  end

  def edit
  	@book = Book.find(params[:id])
    book.save
    redirect_to book_path(@book.id)

  end

  def update
  	book = Book.find(params[:id])
  	book.update(book_params)
  	redirect_to book_path(book.id)


  end

  def destroy
   book = Book.find(params[:id])
   if book.destroy
   flash[:notice]='book was succesfully destroyed'
   redirect_to books_path
   else
      render :index
   end

  end

  private
  def book_params
  	params.require(:book).permit(:title,:body)

  end
end
