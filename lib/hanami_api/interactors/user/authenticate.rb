# frozen_string_literal: true

require 'hanami/interactor'

class User::Authenticate
  include Hanami::Interactor
  expose :token

  def initialize(user_repository: UserRepository.new, password_service: Password.new)
    @user_repository = user_repository
    @password_service = password_service
  end

  def call(params)
    user = @user_repository.by_email(params[:email])
    if user && @password_service.verify(user.password_digest, params[:password])
      @token = 'khskfghakjhdfgka'
    else
      error!('Authentication failure')
    end
  end
end
