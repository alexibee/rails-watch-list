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
    @list.image_url = 'camera-card.jpg' if /\A(http:|https:).{6,}(.jpg|.jpeg|.png)/.match(@list.image_url).nil?
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def strong_params
    params.require(:list).permit(:name, :image_url)
  end
end
