class SessionsController < ApplicationController


  def new

  end

  def create
    @user = User.find_by_email params[:email]
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Signed in successfully!"
    else
      flash[:alert] = "Wrong credentials"
      redirect_to :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Sign out successfully!"
  end
end
