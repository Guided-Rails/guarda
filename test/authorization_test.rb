require "test_helper"

class Guarda::AuthorizationTest < ActiveSupport::TestCase
  test "#authorize when policy is found and query is true" do
    controller = Controller.new(action_name: "index", controller_path: "tests")

    assert controller.authorize
  end

  test "#authorize when controller is namespaced" do
    controller = Controller.new(
      action_name: "index",
      controller_path: "admin/tests"
    )

    assert controller.authorize
  end

  test "#authorize with optional attributes" do
    controller = Controller.new(action_name: "x", controller_path: "x")

    assert controller.authorize(
      controller: "tests",
      query: "edit?",
      record: Record.new
    )
  end

  test "#authorize when policy is found but query is false" do
    controller = Controller.new(action_name: "show", controller_path: "tests")

    assert_raises Guarda::Authorization::NotAuthorizedError do
      controller.authorize
    end
  end

  test "#authroize when policy is not found" do
    controller = Controller.new(action_name: "index", controller_path: "x")

    assert_raises Guarda::PolicyFinder::NotFoundError do
      controller.authorize
    end
  end

  test "#verify_authorization_performed when performed" do
    controller = Controller.new(action_name: "index", controller_path: "tests")

    assert_nothing_raised do
      controller.authorize
      controller.verify_authorization_performed
    end
  end

  test "#verify_authorization_performed when not performed" do
    controller = Controller.new(action_name: "index", controller_path: "tests")

    assert_raises Guarda::Authorization::AuthorizationNotPerformedError do
      controller.verify_authorization_performed
    end
  end

  test "#policy" do
    controller = Controller.new(action_name: "x", controller_path: "x")
    policy = controller.policy("tests", Record.new)

    assert_kind_of TestsPolicy, policy
  end
end
