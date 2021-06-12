class UsersController < ApplicationController
    def edit 
    end
    
    def update
    end
    
    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        @book.save
        redirect_to books_path
    end

    def index
        @books = Book.all
    end
    
    def show
    end
    
end
