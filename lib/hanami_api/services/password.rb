# frozen_string_literal: true

class Password
  class << self
    def encrypt(attributes)
      password_digest = BCrypt::Password.create(attributes[:password])
      attributes = attributes.merge(password_digest: password_digest)
      attributes.delete(:password)
      attributes
    end

    def verify(password_digest, unencrypted_password)
      BCrypt::Password.new(password_digest).is_password?(unencrypted_password)
    end
  end
end
