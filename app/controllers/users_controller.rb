class UsersController < ApplicationController
  skip_before_action :auth, only: [:new, :create, :login, :find_user, :home]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to edit_user_path
    end
  end

  def show
    @user = User.find(params[:id])
   
    if @user.id == session[:user_id]
      # render show
    else
      flash[:errors] =  "You tried to view another user's page, here is your page."
      redirect_to user_path(session[:user_id])
    end
  end

  def destroy
    @user = User.find(params[:id])
    FavoriteBook.delete_by(user_id: @user.id)
    FavoriteRhyme.delete_by(user_id: @user.id)
    @user.delete
    redirect_to :root
  end

  def login
  end

  def find_user
    @user = User.find_by(username: params[:username] )
    
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:failed] = "Please enter a valid username. #{params[:username]} doesn't exist."
      redirect_to login_path
    end
  end

  def logout
    session.delete :user_id
    redirect_to '/'
  end

  def home
  end

  private 

  def user_params 
    params.require(:user).permit(:username, :name, :age)
  end
end
