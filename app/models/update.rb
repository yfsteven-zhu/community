class Update < ApplicationRecord
  belongs_to :updateable, polymorphic: true
  belongs_to :user
  belongs_to :updateparent, class_name: 'Update', optional: true
  has_many :updatereplies, class_name: 'Update', foreign_key: :updateparent_id, dependent: :destroy

  after_create :add_mentions
  after_commit :create_notifications, on: [:create, :update]

  def add_mentions
    Mention.create_from_text(self)
  end

  def create_notifications
    if self.updateparent.nil?
      Notification.create(
          notify_type: 'update',
          actor: self.user,
          user: self.updateable,
          target: self)
    else
      Notification.create(
          notify_type: 'update',
          actor: self.user,
          user: self.updateparent.user,
          target: self)

    end
  end

end
