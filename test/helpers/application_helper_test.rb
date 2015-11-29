require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title, app_name, 'title helper'
    assert_equal full_title("Home"), "Home | " + app_name, 'title helper for Home'
  end
end
