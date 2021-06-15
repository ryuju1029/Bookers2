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

end
