class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.new(bookmark_params)
    if @bookmark.save
      redirect_to @bookmark.list
    else
      render :new
    end

    def destroy
      @list = List.find(params[:list_id])
      @bookmark = @list.bookmarks.destroy
      redirect_to @bookmark.list
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:space_id, :list_id)
  end
end
