module PostsHelper

  def current_post
    if (post_id = session[:post_id])
      @current_post ||= Post.find_by(id: post_id)
    end
  end
end
