# frozen_string_literal: true

class JwtAuthenticator
  class << self
    def decode(token)
      decoded_token = JWT.decode(token, nil, false).first
      decoded_token if Time.at(decoded_token&.dig('exp')) >= Time.now
    end
  end
end
