# frozen_string_literal: true

module Api::Controllers::Sessions
  class Create
    include Api::Action

    params do
      required(:email).filled(:str?, format?: /@/)
      required(:password).filled(:str?).confirmation
    end

    def initialize(user_repository: UserRepository.new)
      @user_repository = user_repository
    end

    def call(params)
      email = params.get(:email)
      password = params.get(:password)

      user = @user_repository.by_email(email)
      if user && check_password(user.password_digest, password)
        self.body = 'issue jwt'
      else
        self.body = 'Authentication failure'
      end
    end

    private

    def check_password(password_digest, unencrypted_password)
      BCrypt::Password.new(password_digest).is_password?(unencrypted_password)
    end
  end
end
