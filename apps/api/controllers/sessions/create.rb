# frozen_string_literal: true

module Api::Controllers::Sessions
  class Create
    include Api::Action

    params do
      required(:email).filled(:str?, format?: /@/)
      required(:password).filled(:str?).confirmation
    end

    def initialize(user_repository: UserRepository.new, password_service: Password.new)
      @user_repository = user_repository
      @password_service = password_service
    end

    def call(params)
      email = params.get(:email)
      password = params.get(:password)

      user = @user_repository.by_email(email)
      self.body = if user && @password_service.verify(user.password_digest, password)
                    'issue jwt'
                  else
                    'Authentication failure'
                  end
    end
  end
end
