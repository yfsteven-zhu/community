class UserResetsController < ApplicationController
  before_action :get_user,  only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by(name: params[:user_reset][:name].downcase)
    if @user
      redirect_to new_password_reset_url
    else
      flash.now[:danger] = "User not found"
      render 'new'
    end
  end

end
