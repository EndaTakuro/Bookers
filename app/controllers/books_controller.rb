class BooksController < ApplicationController
  def index
  	@books = Book.all
  	@book = Book.new
  end

  def show
  	@book = Book.find(params[:id])
  end

  def create
  	@book = Book.new(book_params)
  	if @book.save
  		flash[:notice] = "You posted successfully"
  		redirect_to book_path(@book.id)
  	else
  		flash[:alert] = "error"
  		redirect_to index
  	end
  end


  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	book = Book.find(params[:id])
  	if book.update(book_params)
  		flash[:notice] = "You updated successfully"
  		redirect_to book_path(book.id)
  	else
  		flash[:alert] = "error"
  		redirect_to index

  	end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to index
  end

  private
  def book_params
	params.require(:book).permit(:title, :body)
  end
end
