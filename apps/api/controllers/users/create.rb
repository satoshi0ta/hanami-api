# frozen_string_literal: true

module Api::Controllers::Users
  class Create
    include Api::Action

    params do
      required(:user).schema do
        required(:email).filled(:str?, format?: /@/)
        required(:password).filled(:str?).confirmation
      end
    end

    def initialize(interactor: User::Create.new)
      @interactor = interactor
    end

    def call(params)
      @interactor.call(params.get(:user))
    end
  end
end
