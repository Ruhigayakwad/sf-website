class RoomimagesController < ApplicationController
    before_action :set_roomimages, only: %i[show edit update destroy]
  def delete_image
    @pictures = ActiveStorage::Attachment.find(params[:id]) 
    @pictures.purge 
    redirect_to room_roomimage_path
  end

  def index
    @room = Room.find(params[:room_id])
    @roomimage = @room.roomimages
      
  end

  def show
    
  end
    
  def create
    @room = Room.find(params[:room_id])
    @roomimage = @room.roomimages.create(roomimage_params)
    if @roomimage.save
      redirect_to room_roomimage_path
    else
      render :new, status: :unprocessable_entity
    end
  end
      
  def edit
  
  end
    
  def update
    
    if @roomimage.update(roomimage_params)
      redirect_to room_roomimage_path
    else
      render :edit
    end
  end
  def destroy
    @roomimage.destroy
    redirect_to room_path(@room)
  end
  private
  def roomimage_params
    params.require(:roomimage).permit(:name, :photo, pictures: [] )
  end
  def set_roomimages
    @room = Room.find(params[:room_id])
    @roomimage = @room.roomimages.find(params[:id])
  end
end
