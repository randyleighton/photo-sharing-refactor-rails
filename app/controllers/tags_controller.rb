class TagsController < ApplicationController

  def new
    @photo = Photo.find_by_id(params[:photo_id])
    @tag = Tag.new(tag_params)
    @user = User.find_by_id(current_user)
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @tag = @photo.tags.new(tag_params)
    if @tag.save
      flash[:notice] = "Successful"
      redirect_to root_path
    else
      redirect_to user_path
    end
  end

  def show
  end


private
  def tag_params
    params.require(:tag).permit(:user_id, :photo_id)
  end
end
