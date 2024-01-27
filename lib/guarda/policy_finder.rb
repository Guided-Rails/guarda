module Guarda
  class PolicyFinder
    class NotFoundError < StandardError; end

    def initialize(controller_name)
      @controller_name = controller_name
    end

    def self.find(controller_name)
      new(controller_name).find
    end

    def find
      policy_class.presence || raise(NotFoundError, policy_class_name)
    end

    private

    attr_reader :controller_name

    def policy_class
      policy_class_name.safe_constantize
    end

    def policy_class_name
      controller_name.camelize.concat("Policy")
    end
  end
end
