# frozen_string_literal: true

module Api::Controllers::Authentication
  module Skip
    private

    def authenticate!; end
  end

  def self.included(action)
    action.class_eval do
      before :authenticate!
      expose :current_user
    end
  end

  def authenticate!
    _, jwt = request.env['HTTP_AUTHORIZATION'].to_s.split
    decoded_token = JwtAuthenticator.decode(jwt)
    result = User::Authentication.new.call(decoded_token)
    @current_user = result.user
  rescue StandardError
    halt 401
  end
end
