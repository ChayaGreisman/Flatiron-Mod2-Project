class ApplicationController < ActionController::Base
  before_action :auth

  def auth
    if session[:user_id]
      # goes to action
    else
      redirect_to '/'
    end
  end

  def display_nav? 
    controller_actions = [ 'users#new', 'users#login', 'users#home' ]
    current_controller_action = [params[:controller], params[:action]].join("#") 
    return controller_actions.include?(current_controller_action) ? false : true
  end

  helper_method :display_nav?
end
