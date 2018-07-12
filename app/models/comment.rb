class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  belongs_to :parent, class_name: 'Comment', optional: true
  has_many :replies, class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy


  validates :content, presence: true

  after_commit :create_notifications, on: [:create]
  def create_notifications
    if self.parent.nil?
    Notification.create(
        notify_type: 'comment',
        actor: self.user,
        user: self.commentable.user,
        target: self,
        second_target: self.commentable)
    else
      Notification.create(
          notify_type: 'comment',
          actor: self.user,
          user: self.parent.user,
          target: self,
          second_target: self.commentable)

      end
  end


end
