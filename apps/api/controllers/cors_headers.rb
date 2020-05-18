# frozen_string_literal: true

module Api::Controllers::CorsHeaders
  def self.included(action)
    action.class_eval do
      before :include_cors_headers
    end
  end

  def include_cors_headers
    headers.merge!(cors_headers)
  end

  private

  def cors_headers
    {
      'Access-Control-Allow-Origin' => '*',
      'Access-Control-Allow-Methods' => 'GET,POST,PUT,PATCH,OPTIONS,DELETE',
      'Access-Control-Allow-Headers' => 'Content-Type,Accept,Auth-Token,Authorization'
    }
  end
end
