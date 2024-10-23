require "application_system_test_case"

class ClassStatusesTest < ApplicationSystemTestCase
  setup do
    @class_status = class_statuses(:one)
  end

  test "visiting the index" do
    visit class_statuses_url
    assert_selector "h1", text: "Class Statuses"
  end

  test "creating a Class status" do
    visit class_statuses_url
    click_on "New Class Status"

    fill_in "Class list", with: @class_status.class_list_id
    fill_in "User", with: @class_status.user_id
    click_on "Create Class status"

    assert_text "Class status was successfully created"
    click_on "Back"
  end

  test "updating a Class status" do
    visit class_statuses_url
    click_on "Edit", match: :first

    fill_in "Class list", with: @class_status.class_list_id
    fill_in "User", with: @class_status.user_id
    click_on "Update Class status"

    assert_text "Class status was successfully updated"
    click_on "Back"
  end

  test "destroying a Class status" do
    visit class_statuses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Class status was successfully destroyed"
  end
end
