class UsersController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:email, :password, :password_confirmation))

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: "sdkfjdlkfjsd" }
      else
        format.html { render :new }
      end
    end
  end
end
