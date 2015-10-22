class SessionsController < ApplicationController

  def new #send to sign in page
    render :new
  end

  def create
    @user = User.find_by_credentials(
      user_params[:email],
      user_params[:password]
      )
    if @user.nil?
      flash.now[:errors] = "Incorrect username or password."
      render :new
    else
      sign_in(@user)
      flash[:notice] = "Welcome back!"
      redirect_to user_url(@user)
    end
  end

  def destroy
    sign_out
    flash[:notice] = "Successfully signed out. See you soon."
    redirect_to new_session_url
  end

  private

    def user_params
      params.require(:user).permit(:email, :password)
    end



end
