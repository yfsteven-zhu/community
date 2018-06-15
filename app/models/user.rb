class User < ApplicationRecord

  has_many :posts, dependent: :destroy

  attr_accessor :remember_token, :reset_token

  before_save { self.name = name.downcase }

  validates:name, presence: true, length: { minimum:3, maximum:20 }, 
                        format: { with:/\A[\w\.\-\@]+\z/, 
                             message: "only allows letter, number, _, - and @" },
                        uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: {minimum: 6,
        message:"minimum length of password is 6"}, 
        format: {with:/\A[\S\d]+\z/, message: "no space allowed"}, allow_nil: true

  validates :security_question, presence: true, length: {minimum: 6}

  validates :security_answer, presence: true, length: {minimum: 2}

  mount_uploader :picture, PictureUploader

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remember a user in the database for use in persistent sessions
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # returns true if the given token matches
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(reset_token))
  end

  def feed
    @post = Post.all
  end

end
