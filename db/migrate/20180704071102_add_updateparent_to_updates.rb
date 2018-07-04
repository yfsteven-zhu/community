class AddUpdateparentToUpdates < ActiveRecord::Migration[5.2]
  def change
    add_reference :updates, :updateparent, foreign_key: true
  end
end
