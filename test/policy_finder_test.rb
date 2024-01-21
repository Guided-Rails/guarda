require "test_helper"

class Guarda::PolicyFinderTest < ActiveSupport::TestCase
  test "find" do
    controller_name = "tests"

    policy_class = Guarda::PolicyFinder.find(controller_name)

    assert_equal TestsPolicy, policy_class
  end

    # controller_name "admin/tests"
    # AdminTestsPolicy

  # not found
  # controller_name = "prides"
  # raises Guarda::PolicyNotFoundError
end
