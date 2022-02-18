class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(strong_params)
    if @list.photo.image_url.nil?
      @list.photo.image_url = 'https://res.cloudinary.com/dhoecmw9w/image/upload/v1645186968/b9xz7zvvddzkqmf3ldjh.jpg'
    end

    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def strong_params
    params.require(:list).permit(:name, :photo)
  end
end
