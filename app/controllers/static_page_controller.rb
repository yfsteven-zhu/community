class StaticPageController < ApplicationController
  def home
    @latest_posts = Post.all.order('created_at desc').limit(3)
    @user = User.new
  end

  def about
  end

  def community
    if logged_in?
      @post = current_user.posts.build
      @posts = Post.all.order('created_at desc').paginate(page: params[:page], :per_page => 5)

    end

    @posts = Post.all.order('created_at desc').paginate(page: params[:page], :per_page => 5)
  end


  def recent
    @posts = Post.recent.paginate(page: params[:page], :per_page => 5)
    render action: :community
  end

  def reply
    @posts = Post.reply.paginate(page: params[:page], :per_page => 5)
    render action: :community
  end
end
