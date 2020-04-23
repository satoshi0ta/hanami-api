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
    if @user_repository.by_email(user_attributes[:email]) && true
      error!('The email is already taken')
    end

    user_with_encrypted_password = @password_service.encrypt(user_attributes)
    @user = @user_repository.create(user_with_encrypted_password)
    @user
  end
end
