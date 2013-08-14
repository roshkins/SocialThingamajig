require 'bcrypt'
class User < ActiveRecord::Base
  attr_accessible :password_digest, :username, :password, :session_token

  validates :username, :password_digest, :presence => true

  def password=(plaintext)
    if plaintext.blank?
      self.errors.add(:password, "doesn't have any non-blank chars.")
    else
      self.password_digest = BCrypt::Password.create(plaintext)
    end
  end

  def password_digest_equals?(plaintext)
    BCrypt::Password.new(self.password_digest) == plaintext
  end

  def session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end
end
