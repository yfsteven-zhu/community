class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page], :per_page => 5)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Community!"
      redirect_to @user
    else
       render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def overview
    @user = User.find(params[:id])

  end

  def posts_list
    @user = User.find(params[:id])
    @posts = @user.posts.all.order('created_at desc')

  end

  def comments_list
    @user = User.find(params[:id])
    @comments = @user.comments.all.order('created_at desc')
    @posts = Post.all
  end

  def followinglist
    @user = User.find(params[:id])
    @follow_member = @user.following.all
  end

  def followerlist
    @user = User.find(params[:id])
    @follow_member = @user.followers.all
  end

  private 

    def user_params
      params.require(:user).permit(:name, :password,
                                     :password_confirmation,
                                     :security_question,
                                     :security_answer,
                                     :picture,
                                     :introduction)
    end

    #confirm a logged-in user
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # confirms an admin user
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    def default_url
       "default.jpg"
    end
end