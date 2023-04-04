class UserdetailsController < ApplicationController
    def index
        @user = Userdetail.all
    end

    def show
        
        @user = Userdetail.find(params[:id])
        
    end
            
    def new
        @user = Userdetail.new
    end
            
    def create
        @user = Userdetail.new(user_params)
        UserMailer .send_email(@user).deliver_now
        if @user.save
          redirect_to @user
        else
          render :new, status: :unprocessable_entity
        end
    end
    
    def edit
        @user = Userdetail.find(params[:id])
    end
      
    def update
        @user = Userdetail.find(params[:id])
        if @user.update(user_params)
            UserMailer .send_email(@user).deliver_now  
            redirect_to userdetails_path(@user)
        else
            render :edit
        end
    end
    
    def destroy
        @user = Userdetail.find(params[:id])
        @user.destroy
        redirect_to userdetails_path
    end
     private
      def user_params
        params.require(:userdetail).permit(:name, :phoneno , :email )
      end
 

end
