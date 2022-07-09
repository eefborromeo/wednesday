class UserController < ApplicationController
  before_action :set_user

  def edit
  end

  def edit_money
  end

  def update
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def update_money
    if @user.update(user_params)
      redirect_to root_path, notice: "You have successfully updated your balance."
    else
      redirect_to edit_user_money_path(current_user), alert: "#{@user.errors.first.message}"
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
      params.require(:user).permit(:email, :password, :money)
  end
end
