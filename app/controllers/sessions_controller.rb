class SessionsController < ApplicationController

def index
  redirect_to root_path
end
  def new
  end

  def create
    user = User.find_by_userid(params[:userid])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Welcome #{user.userid}, you successfully signed in!"
    else
      redirect_to root_path, alert: "User ID and/or Password are invalid!"
    end
  end

  def destroy
      session[:user_id] = nil
      redirect_to root_path, notice: "You successfully logged out!"
  end
end
