class BooksController < ApplicationController
  respond_to :html
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.order("created_at").last(10)
    respond_with(@books)
  end

  def show
    respond_with(@book)
  end

  def new
    @book = Book.new
    respond_with(@book)
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    @book.save
    respond_with(@book)
  end

  def update
    @book.update(book_params)
    respond_with(@book)
  end

  def destroy
    @book.destroy
    respond_with(@book)
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :author, :editorial, :original_title, :translation, :edition, :edition_date, :edition_place, :publication_year, :isbn, :cover)
    end
end
