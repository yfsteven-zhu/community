class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      flash[:success] = "Welcome Back to Community :)"
      redirect_back_or community_path
    else
      flash.now[:login_danger] = 'Invalid user name or password'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = "You Have Log Out Successfully. See You Next Time :)"
    redirect_to community_path
  end
end
