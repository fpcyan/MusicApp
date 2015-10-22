class SessionsController < ApplicationController

  def new #send to sign in page
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:email],
      params[:password]
    )
    if sign_in(@user)
      flash[:notice] << "Welcome back!"
      redirect_to user_url(@user)
    else
      flash.now[:errors]
      render :new
    end
  end

  def destroy
    if sign_out(current_user)
      flash[:notice] << "Successfully signed out. See you soon."
      redirect_to new_session_url
    else
      raise "failed to sign out"
    end
  end




end
