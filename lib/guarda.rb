# frozen_string_literal: true

require "active_support/concern"
require_relative "guarda/version"
require_relative "guarda/policy_finder"
require_relative "guarda/authorization"

module Guarda
  class Error < StandardError; end
end
