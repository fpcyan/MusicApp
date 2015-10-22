class UsersController < ApplicationController
  before_action :ensure_signed_in, only: [:show, :edit, :update, :destroy]

  def new # sign up
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Welcome!"
      sign_in(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    render :show
  end

  def edit
    render :edit
  end

  # def update
  #   @user = current_user
  #   if @user.update(user_params)
  #     flash[:notice] = "Successfully updated."
  #     redirect_to user_url(@user)
  #   else
  #     flash.now[:errors] = @user.errors.full_messages
  #     render :edit
  #   end
  # end
  #
  # def destroy
  #   @user = current_user
  #   if @user.destroy
  #     sign_out
  #     flash[:notice] = "Account deleted"
  #     redirect_to new_user_url
  #   else
  #     flash.now[errors] = @user.errors.full_messages
  #     render :edit
  #   end
  # end

  private

    def user_params
      params.require(:user).permit(:email, :password)
    end


end
