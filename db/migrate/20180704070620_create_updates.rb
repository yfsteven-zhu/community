class CreateUpdates < ActiveRecord::Migration[5.2]
  def change
    create_table :updates do |t|
      t.references :updateable, polymorphic: true
      t.references :user, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
