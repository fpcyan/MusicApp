class SessionsController < ApplicationController

  def new #send to sign in page
    render :new
  end

  def create
    @user = User.find_by_credentials(
      user_params[:email],
      user_params[:password]
    )
    if @user.sign_in
      flash[:notice] << "Welcome back!"
      redirect_to user_url(@user)
    else
      flash.now[:errors]
      render :new
    end
  end

  def destroy
    @user = User.find_by_credentials

    if sign_out(@user)
      flash[:notice] << "Successfully signed out. See you soon."
      redirect_to new_session_url
    end
  end


end
