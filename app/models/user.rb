require 'bcrypt'
class User
  include DataMapper::Resource
  property :id, Serial
  property :username, String, unique: true
  property :password_digest, BCryptHash

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = self.first(username: username)
    user if user && BCrypt::Password.new(user.password_digest) == password
  end
end
