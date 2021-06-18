class UsersController < ApplicationController

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(@user)
    end 

    def index
        @user =  current_user.id
        @new_book = Book.new
        @users = User.all
    end

    def show
        @book = Book.new
        @user = User.find(params[:id])
        @books = @user.books
    end

    private

    def user_params
        params.require(:user).permit(:name, :introduction, :profile_image)
    end

end
