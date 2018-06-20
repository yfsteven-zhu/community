class RemoveSecurityToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :security_question
    remove_column :users, :security_answer
  end
end
