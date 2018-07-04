class RemoveUserUpdate < ActiveRecord::Migration[5.2]

  def down
    drop_table :user_updates
  end
end
