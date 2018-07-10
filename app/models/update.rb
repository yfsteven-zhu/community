class Update < ApplicationRecord
  belongs_to :updateable, polymorphic: true
  belongs_to :user
  belongs_to :updateparent, class_name: 'Update', optional: true
  has_many :updatereplies, class_name: 'Update', foreign_key: :updateparent_id, dependent: :destroy


end
