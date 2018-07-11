class Update < ApplicationRecord
  belongs_to :updateable, polymorphic: true
  belongs_to :user
  belongs_to :updateparent, class_name: 'Update', optional: true
  has_many :updatereplies, class_name: 'Update', foreign_key: :updateparent_id, dependent: :destroy

  after_create :add_mentions
  #after_commit :create_notifications, on: [:create, :update]

  def add_mentions
    Mention.create_from_text(self)
    Notification.create(
        notify_type: 'update',
        actor: self.user,
        user: self.updateable,
        target: self)
  end


end
