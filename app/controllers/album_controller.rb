class AlbumController < ApplicationController
  before_filter :authenticate_user!
 ########this will show all album on index page
  def index
    @albums=current_user.albums.all
  end
  ##### this will open page for the create new album
  def new
    @album= Album.new
  end
  ######  this will create tha new album
  def create
    if current_user.albums.create(:name=>params[:name]).valid?
      redirect_to :action=>:index
      return
    end
    redirect_to :back
  end
 #### this will delete album and all its associated photos through ajax call
  def destroy
    current_user.albums.find(params[:id]).destroy
    respond_to do |format|
      format.js
    end
  end
##### this will check for duplication of album name for current_user
  def dup_album_name
    value=current_user.albums.find_by_name(params[:name])
    text=""
    if value
      text="yes"
    else
      text="no"
    end
    render :text=>text
  end
end
