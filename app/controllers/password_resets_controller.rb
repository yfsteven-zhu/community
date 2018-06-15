class PasswordResetsController < ApplicationController
  before_action :get_user,  only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]


  def new
  end

  def create
    @user = User.find_by(name: params[:password_reset][:name].downcase)
    if @user
      @user.create_reset_digest
      redirect_to edit_password_reset_url(@user.reset_token)
    else
      flash.now[:danger] = "User name not found"
      render 'new'
    end
  end

  def edit
  end
end
