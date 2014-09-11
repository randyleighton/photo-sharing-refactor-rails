class PhotosController < ApplicationController

  def new
    @photo = current_user.photos.new
  end

  def create
    @photo = Photo.new(photo_params)
    current_user.photos << @photo
    if @photo.save
      flash[:notice] = "Saved"
      redirect_to user_path(current_user)
    else
      render "new"
    end
  end

  def show
  end

  def update
    @photo = Photo.find(params[:id])
    # @tag = Tag.create(:user_id => @user.id, :photo_id => @photo.id)
    # if @tag.valid?
    #   flash[:notice] = "Tags were saved"
    #   redirect_to root_path
    # else
    #   redirect_to user_path
    # end
  end


private
  def photo_params
    params.require(:photo).permit(:image)
  end
end
