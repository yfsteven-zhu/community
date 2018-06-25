class AddCommentCreateAtToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :comment_create_at, :timestamp
  end
end
