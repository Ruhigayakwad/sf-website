class RoomsController < ApplicationController
    before_action :set_room, only: %i[show edit update destroy]
    before_action :authenticate_user!, except: [:show, :index]
    
    def index
      @room = Room.all
    end
    
    
    def show
    end
          
    def new
      @room = Room.new
    end
          
    def create
      @room = Room.new(room_params)
      if @room.save
        redirect_to @room
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
      
    end
    
    def update
      if @room.update(room_params)
        redirect_to rooms_path(@room)
      else
        render :edit
      end
    end
  
    def destroy
      @room.destroy
      redirect_to rooms_path
    end
   private
   def room_params
      params.require(:room).permit(:name)
    end
    def set_room
      @room = Room.find(params[:id])
    end
end
