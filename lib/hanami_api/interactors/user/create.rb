# frozen_string_literal: true

require 'hanami/interactor'

class User::Create
  include Hanami::Interactor
  expose :user

  def initialize(user_repository: UserRepository.new, password_service: Password.new)
    @user_repository = user_repository
    @password_service = password_service
  end

  def call(user_attributes)
    user_with_encrypted_password = @password_service.encrypt(user_attributes)
    @user_repository.create(user_with_encrypted_password)
  end
end
