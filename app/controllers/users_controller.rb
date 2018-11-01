class UsersController < ApplicationController
    def index
    end

    def create
        @user = User.new users_params
        if !here? && @user.save
            redirect_to user_path(@user)
        else
        render text: 'Maybe there is you in database'
        end
    end

    def here? 
        User.where(login:params[:login]).first != nil
    end
     
    def new 
        @user = User.new
    end

    def show
        @users = User.all
    end

    def destroy
        @current_user_id = params[:id].first
        User.destroy_all "id IN (?)", @checked_id
        if @checked_id.index @current_user_id
            redirect_to user_path @current_user_id
        else
            redirect_to root_path
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(users_params)
            redirect_to root_path
        else
            redirect_to root_path
        end
    end

    private 
        def users_params
            params.require(:user).permit(:login,:password)
        end
end
