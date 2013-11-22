class User < ActiveRecord::Base
  attr_accessible :password_digest, :session_token, :username
  attr_accessible :password

  has_many :goals
  has_many :cheers, through: :goals, source: :cheers

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!

    self.session_token
  end

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return user if !!user && user.is_password?(password)
    nil
  end

  def count_cheers
    self.cheers.length
  end

  def average_cheers_per_goal
    return self.cheers.length/self.goals.length.to_f unless self.goals.empty?
    0
  end

  def is_password?(pass)
    BCrypt::Password.new(self.password_digest).is_password?(pass)
  end

end
