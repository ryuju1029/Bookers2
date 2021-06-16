class UsersController < ApplicationController
    def edit

    end

    def update
    end
    
    def index
        @books = Book.all
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
