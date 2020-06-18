class BooksController < ApplicationController

    def index
        @categories = BookCategory.all
    end

    def show
        @user = User.find(session[:user_id])
        @book = Book.find(params[:id])
    end

    def favorite 
        @user = User.find(session[:user_id])
        @book = Book.find(params[:id])
        if find_favorite_book
            find_favorite_book.delete
        else
            FavoriteBook.create(user_id: session[:user_id], book_id: @book.id)
        end
        redirect_to book_path(@book)
    end

    private

    def find_favorite_book
        FavoriteBook.find_by(user_id: @user.id, book_id: @book.id)
    end
end

