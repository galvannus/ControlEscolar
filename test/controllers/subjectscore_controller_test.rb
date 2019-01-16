require 'test_helper'

class SubjectscoreControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get subjectscore_new_url
    assert_response :success
  end

  test "should get create" do
    get subjectscore_create_url
    assert_response :success
  end

end
