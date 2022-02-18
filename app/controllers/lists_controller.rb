class ListsController < ApplicationController
  require 'open-uri'
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(strong_params)
    @list.photo.attach(strong_params[:photo])
    if @list.photo.attached? == false
      @list.photo.attach(io: image_grab, content_type: 'image/jpg')
    end
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def image_grab
    URI.open('https://res.cloudinary.com/dhoecmw9w/image/upload/v1645186968/b9xz7zvvddzkqmf3ldjh.jpg')
  end

  def strong_params
    params.require(:list).permit(:name, :photo)
  end
end
