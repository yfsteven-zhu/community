class AddSecurityToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :security_question, :string
    add_column :users, :security_answer, :string
  end
end
