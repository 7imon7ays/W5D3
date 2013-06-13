require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_digest, :token


  has_many :subs, foreign_key: :moderator_id, inverse_of: :moderator
  has_many :comments, foreign_key: :author_id
  has_many :links, foreign_key: :uploader_id

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.token = SecureRandom::urlsafe_base64(16)
    self.save!
    self.token
  end

  def valid_password?(password)
    BCrypt::Password.new(self.password_digest) == password
  end

end
