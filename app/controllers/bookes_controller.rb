class BookesController < ApplicationController

    def create
    end

    def index
    end

    def show
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
