class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :check_auth, except: [:show, :index]
  before_action :set_book, only: [:update, :show, :destroy, :edit]
  before_action :set_author_and_genres, only: [:new, :edit, :create, :update]

  def index
    @books = Book.order(:title)
  end

  def show
    #has @book
  end

  def new
    @book = Book.new
  end

  def create
    # render json: params
    @authors = Author.order(:last_name)
    @book = Book.new(get_params)
    authorize @book
    if @book.save
      redirect_to @book
    else
      flash.now[:errors] = @book.errors.full_messages
      render action: "new"
    end
  end

  def edit
    #has @book
    @authors = Author.order(:last_name)
    @genres = Genre.order(:name)
  end

  def update
    #has @book
    authorize @book
    if @book.update(get_params)
      redirect_to @book
    else
      flash.now[:errors] = @book.errors.full_messages
      render action: "edit"
    end
  end

  def destroy
    #has @book
    @book.destroy
    redirect_to books_path
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def get_params
    return params.require(:book).permit(:title, :author_id, :cover, genre_ids: [])
  end

  def set_author_and_genres
    @authors = Author.order(:last_name)
    @genres = Genre.order(:name)
  end

  def check_auth
    authorize Book
  end
end
