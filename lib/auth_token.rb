class AuthToken
  class << self
    def issue(payload)
      payload[:created_at] = Time.now.utc.to_i
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end

    def valid?(token)
      JWT.decode(token, Rails.application.secrets.secret_key_base) rescue false
    end
  end
end
