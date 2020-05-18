# frozen_string_literal: true

module Api::Controllers::Users
  class Login
    include Api::Action
    include Api::Controllers::Authentication::Skip
    accept :json

    params do
      required(:email).filled(:str?, format?: /@/)
      required(:password).filled(:str?)
    end

    def initialize(interactor: User::Login.new)
      @interactor = interactor
    end

    def call(params)
      halt 400 unless params.valid?

      result = @interactor.call(params.to_h)
      if result.successful?
        self.body = JSON.generate(type: 'Bearer', token: result.token)
        self.status = 201
      else
        self.body = result.errors
        self.status = 401
      end
    end
  end
end
