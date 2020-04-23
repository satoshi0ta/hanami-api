# frozen_string_literal: true

class JwtIssuer
  class << self
    def generate(user)
      payload = {
        user_id: user.id
      }
      encode(payload)
    end

    def encode(payload)
      JWT.encode(payload, nil, 'none')
    end

    def decode(token)
      JWT.decode(token, nil, false)
    end
  end
end
