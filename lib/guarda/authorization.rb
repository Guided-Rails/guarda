module Guarda
  module Authorization
    extend ActiveSupport::Concern

    class NotAuthorizedError < StandardError; end

    def authorize(controller: nil, query: nil, record: nil)
      controller ||= controller_path
      query ||= "#{action_name}?"

      policy(controller, record).public_send(query) ||
        raise(NotAuthorizedError, self.class)
    end

    def policy(controller, record)
      PolicyFinder.find(controller).new(record)
    end
  end
end
