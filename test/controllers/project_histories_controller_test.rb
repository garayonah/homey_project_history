require "test_helper"

class ProjectHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_history = project_histories(:one)
  end

  test "should get index" do
    get project_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_project_history_url
    assert_response :success
  end

  test "should create project_history" do
    assert_difference("ProjectHistory.count") do
      post project_histories_url, params: { project_history: { comment: @project_history.comment, project_id: @project_history.project_id, status_after: @project_history.status_after, status_before: @project_history.status_before, user_id: @project_history.user_id } }
    end

    assert_redirected_to project_history_url(ProjectHistory.last)
  end

  test "should show project_history" do
    get project_history_url(@project_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_history_url(@project_history)
    assert_response :success
  end

  test "should update project_history" do
    patch project_history_url(@project_history), params: { project_history: { comment: @project_history.comment, project_id: @project_history.project_id, status_after: @project_history.status_after, status_before: @project_history.status_before, user_id: @project_history.user_id } }
    assert_redirected_to project_history_url(@project_history)
  end

  test "should destroy project_history" do
    assert_difference("ProjectHistory.count", -1) do
      delete project_history_url(@project_history)
    end

    assert_redirected_to project_histories_url
  end
end
