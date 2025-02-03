require "application_system_test_case"

class ProjectHistoriesTest < ApplicationSystemTestCase
  setup do
    @project_history = project_histories(:one)
  end

  test "visiting the index" do
    visit project_histories_url
    assert_selector "h1", text: "Project histories"
  end

  test "should create project history" do
    visit project_histories_url
    click_on "New project history"

    fill_in "Comment", with: @project_history.comment
    fill_in "Project", with: @project_history.project_id
    fill_in "Status after", with: @project_history.status_after
    fill_in "Status before", with: @project_history.status_before
    fill_in "User", with: @project_history.user_id
    click_on "Create Project history"

    assert_text "Project history was successfully created"
    click_on "Back"
  end

  test "should update Project history" do
    visit project_history_url(@project_history)
    click_on "Edit this project history", match: :first

    fill_in "Comment", with: @project_history.comment
    fill_in "Project", with: @project_history.project_id
    fill_in "Status after", with: @project_history.status_after
    fill_in "Status before", with: @project_history.status_before
    fill_in "User", with: @project_history.user_id
    click_on "Update Project history"

    assert_text "Project history was successfully updated"
    click_on "Back"
  end

  test "should destroy Project history" do
    visit project_history_url(@project_history)
    click_on "Destroy this project history", match: :first

    assert_text "Project history was successfully destroyed"
  end
end
