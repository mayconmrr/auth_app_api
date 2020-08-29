class Session
  def self.authenticate(username, password)
    return false if username.blank? || password.blank?
    user = User.find_by(username: username)
    user && user.authenticate(password) ? user : false
  end
end
