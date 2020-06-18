class RhymesController < ApplicationController

    def index
        @categories = RhymeCategory.all
    end

    def show
        @user = User.find(session[:user_id])
        @rhyme = Rhyme.find(params[:id])
    end

    def favorite
        @user = User.find(session[:user_id])
        @rhyme = Rhyme.find(params[:id])
        if find_favorite_rhyme
            find_favorite_rhyme.delete
        else
            FavoriteRhyme.create(user_id: session[:user_id], rhyme_id: @rhyme.id)
        end
        redirect_to rhyme_path(@rhyme)
    end
    
    private

    def find_favorite_rhyme
        FavoriteRhyme.find_by(user_id: @user.id, rhyme_id: @rhyme.id)
    end

end
