class BooksController < ApplicationController
  respond_to :html
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :clear_search_index, only: [:index]

  def index
    @search = Book.search(search_params)
    @search.sorts = 'name' if @search.sorts.empty?
    @books = @search.result().page(params[:page])
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
    params[:book][:authors_attributes].each do |k, author|
      Authoring.create({:author_id => author[:id], :book_id => @book.id})
    end
    respond_with(@book)
  end

  def update
    @book.update(book_params)

    #update authorings table
    params[:book][:authors_attributes].each do |k, author|
      #delete the relation
      if author[:_destroy].eql? "1"
        Authoring.where(:author_id => author[:id], :book_id => @book.id).limit(1).first.destroy
      else
        #adds the new ones
        if !author[:_new].eql? "1"
          Authoring.create({:author_id => author[:id], :book_id => @book.id})
        end
      end
    end

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
      params.require(:book).permit(:title, :author, :original_title, :translation, :edition, :edition_date, :edition_place, :publication_year, :isbn, :cover, :editorial_id)
    end

    def search_params
      params[:q]
    end

    def clear_search_index
      if params[:search_cancel]
        params.delete(:search_cancel)
        if(!search_params.nil?)
          search_params.each do |key, param|
            search_params[key] = nil
          end
        end
      end
    end
end
