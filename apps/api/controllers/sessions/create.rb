# frozen_string_literal: true

module Api::Controllers::Sessions
  class Create
    include Api::Action
    accept :json

    params do
      required(:email).filled(:str?, format?: /@/)
      required(:password).filled(:str?).confirmation
    end

    def initialize(interactor: User::Authenticate.new)
      @interactor = interactor
    end

    def call(params)
      result = @interactor.call(params.to_h)
      if result.successful?
        self.body = result.token
        self.status = 201
      else
        self.body = result.errors
        self.status = 422
      end
    end
  end
end
