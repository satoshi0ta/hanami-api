# frozen_string_literal: true

require 'hanami/interactor'

class User::Create
  include Hanami::Interactor
  expose :user

  def initialize(repository: UserRepository.new)
    @repository = repository
  end

  def call(user_attributes)
    user_with_encrypted_password = Password.encrypt(user_attributes)
    @repository.create(user_with_encrypted_password)
  end
end
