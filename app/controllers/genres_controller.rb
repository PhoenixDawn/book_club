class GenresController < ApplicationController
  before_action :set_genre, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  def index
    @genres = Genre.order(:name)
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(get_params)
    if @genre.save
      redirect_to genres_path
    else
      flash.now[:errors] = @genre.errors.full_messages
      render "new", action: "new"
    end
  end

  def edit
  end

  def update
    if @genre.update(get_params)
      redirect_to genres_path
    else
      flash.now[:errors] = @genre.errors.full_messages
      render "edit", action: "edit"
    end
  end

  def destroy
    @genre.destroy
    redirect_to genres_path
  end

  private

  def get_params
    params.require("genre").permit(:name)
  end

  def set_genre
    @genre = Genre.find(params[:id])
  end
end
