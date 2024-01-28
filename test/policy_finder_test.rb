require "test_helper"

class Guarda::PolicyFinderTest < ActiveSupport::TestCase
  test ".find" do
    controller_name = "tests"

    policy_class = Guarda::PolicyFinder.find(controller_name)

    assert_equal TestsPolicy, policy_class
  end

  test ".find with namespaced controller" do
    controller_name = "admin/tests"

    policy_class = Guarda::PolicyFinder.find(controller_name)

    assert_equal Admin::TestsPolicy, policy_class
  end

  test ".find when policy cannot be found" do
    controller_name = "nopolicy"

    assert_raises Guarda::PolicyFinder::NotFoundError do
      Guarda::PolicyFinder.find(controller_name)
    end
  end
end
