class User < ActiveRecord::Base
  attr_accessor :email, :password, :password_hash

  validate :validarpass

  before_create :encrypt

  def validarpass(email, password)
    if password == password_hash
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
