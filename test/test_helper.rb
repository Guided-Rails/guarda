# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "guarda"

require "active_support"
require "minitest/reporters"

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(:color => true)]
