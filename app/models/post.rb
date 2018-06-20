class Post < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  is_impressionable :counter_cache => true

  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  scope :recent, -> { order(created_at: :desc) }
  scope :reply, ->{ order(updated_at: :desc)}
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validate :picture_size

    mapping do
      indexes :title
      indexes :content
      indexes :user_id
      indexes :created_at
      indexes :updated_at
    end

  def as_indexed_json(options = {})
    self.as_json(only: [:title, :content, :user_id, :created_at, :updated_at],
      include: {
        user: { only: [:name]}
      })
  end

  class << self
    def search(query)
      __elasticsearch__.search(query: multi_match_query(query),
                                          highlight: high_light(query) )
    end
    
    def multi_match_query(query)
      {
        multi_match: {
          query: query,
          type: "best_fields",
          fields: ["title^5","content^4", "user.name"],
          operator: "and"}
      }
    end

    def high_light(query) {
      pre_tags: ['<em>'],
      post_tags: ['</em>'],
      fields: {
        title: {},
        content: {}
      }
    }
    end

  end
  private
  # Validates the size of an uploaded picture
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end



Post.import(force: true)