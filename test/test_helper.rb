# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "guarda"

require "active_support"
require "minitest/reporters"

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(:color => true)]

class Controller
  include Guarda::Authorization

  attr_reader :action_name, :controller_path

  def initialize(action_name:, controller_path:)
    @action_name = action_name
    @controller_path = controller_path
  end
end

class TestsPolicy
  def initialize(record)
    @record = record
  end

  def index?
    true
  end

  def show?
    false
  end

  def edit?
    @record.published?
  end
end

module Admin
  class TestsPolicy
    def initialize(record); end

    def index?
      true
    end
  end
end

class Record
  def published?
    true
  end
end
