class StaticPageController < ApplicationController
  def home
    if logged_in?
      redirect_to community_path
    end
  end

  def about
  end

  def community
    if logged_in?
      @post = current_user.posts.build
      @posts = Post.all.paginate(page: params[:page], :per_page => 5)
      @feed_items = current_user.feed.paginate(page: params[:page], :per_page => 5)
    end

    @posts = Post.all.paginate(page: params[:page], :per_page => 5)
  end
end
