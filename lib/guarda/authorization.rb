# frozen_string_literal: true

module Guarda
  module Authorization
    extend ActiveSupport::Concern

    included do
      if respond_to?(:helper_method)
        helper_method :policy
      end
    end

    def authorize(record = nil, controller: nil, query: nil)
      @_authorization_performed = true
      controller ||= controller_path
      query ||= "#{action_name}?"

      policy(controller, record).public_send(query) ||
        raise(NotAuthorizedError, self.class)
    end

    def policy(controller, record = nil)
      PolicyFinder.find(controller).new(record)
    end

    def verify_authorization_performed
      authorization_performed? ||
        raise(AuthorizationNotPerformedError, self.class)
    end

    private

    def authorization_performed?
      !!@_authorization_performed
    end
  end
end
