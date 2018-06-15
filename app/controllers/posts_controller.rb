class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :admin_user, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to community_path
    else
      @posts = Post.all.paginate(page: params[:page], :per_page => 5)
      render 'static_page/community'
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      flash[:success] = "Post Edited"
      redirect_to community_path
    else
      render 'edit'
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end

  def search
    if params[:q].nil?
      @posts = []
    else
      @posts = Post.search params[:q]
    end
  end


  def destroy
    @post.destroy
    flash[:success] = "Post deleted"
    redirect_to request.referrer ||community_path
  end

  private

    def post_params
      params.require(:post).permit(:title, :content, :picture)
    end

    def correct_user
      unless (current_user.id == Post.find(params[:id]).user_id ||current_user.admin == true)
      	redirect_to(root_url)
      end
    end

    def admin_user
      @post = Post.find_by(id: params[:id])
      redirect_to community_path if @post.nil?
    end

end
