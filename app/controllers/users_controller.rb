class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[user_params])
    if @user.save
      flash[:notice] = "Signup Successful!"
      flash[:color] = "valid"
    else
      flash[:notice] = "Form is Invalid"
      flash[:color] = "invalid"
    end
    render "new"
  end

  private 
    def user_params
      params.require(:user).permit(:username, :email, :encrypted_password, :salt)
    end
  


end
