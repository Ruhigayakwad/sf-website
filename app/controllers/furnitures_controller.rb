class FurnituresController < ApplicationController
    before_action :set_furniture, only: %i[show edit update destroy]
  def delete_image
    @image = ActiveStorage::Attachment.find(params[:id]) 
    @image.purge 
    redirect_to room_furniture_path
  end

  def show
  end
    
  def create
    @room = Room.find(params[:room_id])
    @furniture = @room.furnitures.create(furniture_params)
    if @furniture.save
      redirect_to @room
    else
      render :new, status: :unprocessable_entity
    end
  end
      
  def edit
  end
    
  def update
    if @furniture.update(furniture_params)
      redirect_to room_furniture_path
    else
      render :edit
    end
  end
      
  def destroy
    @furniture.destroy
    redirect_to room_path(@room)
  end
  private
  def furniture_params
    params.require(:furniture).permit(:name, images: [] )
  end
  def set_furniture
    @room = Room.find(params[:room_id])
    @furniture = @room.furnitures.find(params[:id])
  end
end
