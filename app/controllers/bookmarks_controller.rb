class BookmarksController < ApplicationController
  # def new
  #   @list = List.find(params[:list_id])
  #   @bookmark = Bookmark.new
  # end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(strong_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      @bookmarks = @list.bookmarks
      render 'lists/show'
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list_id)
  end

  private

  def strong_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
