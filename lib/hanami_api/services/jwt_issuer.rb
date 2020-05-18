# frozen_string_literal: true

class JwtIssuer
  class << self
    def encode(user)
      payload = {
        uid: user.id,
        exp: (Time.now + 60 * 60 * 24).to_i,
        iat: Time.now.to_i
      }
      JWT.encode(payload, nil, 'none')
    end
  end
end
