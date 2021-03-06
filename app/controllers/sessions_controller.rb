class SessionsController < ApplicationController
  def new
    if current_user then
      redirect_to users_path
    end
  end
  
  def create
    user = User.find_by_email(params[:session][:email])
    
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to conversations_index_path, notice: "Logged in. Enjoy your life."
    else
      flash.now.alert = "User name or password incorrect."
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, alert: "Logged out!"
  end

end
