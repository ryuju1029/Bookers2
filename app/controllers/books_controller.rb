class BooksController < ApplicationController
    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        @book.save
        redirect_to books_path
    end

    def index
    end

    def show
        @user = current_user
        @booker = @book.user
        @book = Book.find(params[:id])
        @newbook = Book.new
    end

    def edit
    end

    def destroy
    end
    
    def update
    end

    private
    def book_params
    params.require(:book).permit(:title, :body)
    end

end
