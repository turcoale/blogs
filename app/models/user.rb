class User < ActiveRecord::Base
  attr_accessor :email, :password

  before_save :encrypt

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == Digest::MD5.digest(password)
      user
    else
      nil
    end
  end

  def encrypt
    if password.present?
      self.password_hash = Digest::MD5.digest(password) # Encrypta la password.
    end
  end

end
