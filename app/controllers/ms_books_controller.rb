class MsBooksController < ApplicationController
  before_action :ms_book, only: [:show, :edit, :update, :destroy]
  def index
    @ms_books = MsBook.where(is_active: true)
  end

  def show
  end

  def edit
  end

  def update
    @ms_book.update(ms_book_params)

    redirect_to ms_books_path
  end

  def new
    @ms_book = MsBook.new
  end

  def create
    @ms_book = MsBook.new(ms_book_params)
    @ms_book.save

    redirect_to ms_books_path
  end

  def destroy
    @ms_book.update(is_active: false)
  end

  private
    def ms_book_params
      params.require(:ms_book).permit(:name, :ms_publisher_id)
    end

    def ms_book
    @ms_book = MsBook.find (params[:id])
  end  
end