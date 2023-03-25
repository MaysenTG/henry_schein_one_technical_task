require "test_helper"

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get questions_index_url
    assert_response :success
  end

  test "should get show" do
    get questions_show_url
    assert_response :success
  end

  test "should get edit" do
    get questions_edit_url
    assert_response :success
  end

  test "should get update" do
    get questions_update_url
    assert_response :success
  end

  test "should get create" do
    get questions_create_url
    assert_response :success
  end

  test "should get delete" do
    get questions_delete_url
    assert_response :success
  end

  test "should get set_params" do
    get questions_set_params_url
    assert_response :success
  end
end
