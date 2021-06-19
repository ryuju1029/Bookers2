class UsersController < ApplicationController

    def edit
        @user = User.find(params[:id])
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

    private

    def user_params
        params.require(:user).permit(:name, :introduction, :profile_image)
    end

end
