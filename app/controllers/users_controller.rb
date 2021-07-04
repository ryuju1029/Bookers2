class UsersController < ApplicationController
    
    before_action :authenticate_user!
    before_action :ensure_correct_user, only: [:edit,:update]
    before_action :set_user, only: [:show, :edit, :update, :destroy, :followings, :followers]
    
    def edit
         @user = User.find(params[:id])
        if @user != current_user
           redirect_to user_path(current_user.id)
        end
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
           flash[:notice] ="You have updated user successfully."
           redirect_to user_path(@user)
        else
           render :edit
        end
    end

    def index
        @user = current_user
        @new_book = Book.new
        @users = User.all
    end

    def show
        @new_book = Book.new
        @user = User.find(params[:id])
        @books = @user.books

    end
    
    def followeds
        @followeds = @user.followed_users
    end

    def followers
        @followers = @user.follower_users
    end

    private

    def user_params
        params.require(:user).permit(:name, :introduction, :profile_image)
    end
    
    def set_user
        @user = User.find(params[:id])
    end


end
