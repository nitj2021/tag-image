class PhotoController < ApplicationController
  before_filter :authenticate_user!
  # ########### to show all photo of a album
  def index
    @id= params[:id]
    @album=current_user.albums.find(@id)
  end

  ############ To upload new photos
  def new
    @id= params[:id]
  end

  ########### To create new photos record
  def create
    photo=current_user.albums.find(params[:id])
    i=0
    while i< params[:total_uploads].to_i
      photo.photos.create(:picture=>params["picture_#{i}"])
      i+=1
    end
    redirect_to :action=>:index, :id=>params[:id]
  end
 ######### to delete a photo on ajax call
  def destroy
    Photo.destroy(params[:id])
    respond_to do |format|
      format.js
    end
  end
 ######### To open original view of an image for tagging
  def show
    @photo=Photo.find(params[:id])
  end
 ######### this will save the tag and cordinates of an image
  def create_tag
    @photo= Photo.find(params[:id])
    @photo.x_cord.push(params[:x_cord])
    @photo.y_cord.push(params[:y_cord])
    @photo.tag.push(params[:tag])
    @photo.save
  end
end
