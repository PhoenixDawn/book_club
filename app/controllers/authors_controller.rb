class AuthorsController < ApplicationController
  before_action :set_author, only: [:edit, :update, :destroy, :show]
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @authors = Author.order(:last_name)
  end

  def show
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(get_params)
    if @author.save
      redirect_to @author
    else
      flash.now[:errors] = @author.errors.full_messages
      render action: "new"
    end
  end

  def edit
  end

  def update
    if @author.update(get_params)
      redirect_to @author
    else
      p @author.errors.full_messages
      p "HERE RIGHT HERE ^^^"
      flash.now[:errors] = @author.errors.full_messages
      render action: "edit"
    end
  end

  def destroy
    @author.destroy
    redirect_to authors_path
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def get_params
    return params.require(:author).permit(:first_name, :last_name)
  end
end
