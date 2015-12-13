class UsersController < ApplicationController
  def new 
    if current_user 
      redirect_to users_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You signed up successfully."
      redirect_to users_path
    else
      flash[:alert] = "Form is invalid!"
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
