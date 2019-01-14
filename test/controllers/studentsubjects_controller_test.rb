require 'test_helper'

class StudentsubjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @studentsubject = studentsubjects(:one)
  end

  test "should get index" do
    get studentsubjects_url
    assert_response :success
  end

  test "should get new" do
    get new_studentsubject_url
    assert_response :success
  end

  test "should create studentsubject" do
    assert_difference('Studentsubject.count') do
      post studentsubjects_url, params: { studentsubject: { student_id: @studentsubject.student_id, subject_id: @studentsubject.subject_id } }
    end

    assert_redirected_to studentsubject_url(Studentsubject.last)
  end

  test "should show studentsubject" do
    get studentsubject_url(@studentsubject)
    assert_response :success
  end

  test "should get edit" do
    get edit_studentsubject_url(@studentsubject)
    assert_response :success
  end

  test "should update studentsubject" do
    patch studentsubject_url(@studentsubject), params: { studentsubject: { student_id: @studentsubject.student_id, subject_id: @studentsubject.subject_id } }
    assert_redirected_to studentsubject_url(@studentsubject)
  end

  test "should destroy studentsubject" do
    assert_difference('Studentsubject.count', -1) do
      delete studentsubject_url(@studentsubject)
    end

    assert_redirected_to studentsubjects_url
  end
end
