class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      flash[:success] = "Welcome back"
      redirect_back_or community_path
    else
      flash.now[:danger] = 'Invalid user name/password'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = "Successful log out"
    redirect_to community_path
  end
end
