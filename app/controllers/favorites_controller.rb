class FavoritesController < ApplicationController

    def create
        book = Book.find(params[:book_id])
        user = current_user
        favorite = Favorite.new(user_id: user.id, book_id: book.id)
        favorite.save
    end

    def destroy
        book = Book.find(params[:book_id])
        #user = current_user
        #favorite = Favorite.find_by(book_id: book.id)
        favorite = current_user.favorites.find_by(book_id:book.id)
        favorite.destroy
    end

end

   #favorite.user_id = current_user.id
   #favorite = Favorite.find_by(book_id: book.id)
