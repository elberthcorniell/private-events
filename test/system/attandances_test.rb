require "application_system_test_case"

class AttandancesTest < ApplicationSystemTestCase
  setup do
    @attandance = attandances(:one)
  end

  test "visiting the index" do
    visit attandances_url
    assert_selector "h1", text: "Attandances"
  end

  test "creating a Attandance" do
    visit attandances_url
    click_on "New Attandance"

    fill_in "Attended event", with: @attandance.attended_event_id
    fill_in "Attendee", with: @attandance.attendee_id
    fill_in "Users", with: @attandance.users
    click_on "Create Attandance"

    assert_text "Attandance was successfully created"
    click_on "Back"
  end

  test "updating a Attandance" do
    visit attandances_url
    click_on "Edit", match: :first

    fill_in "Attended event", with: @attandance.attended_event_id
    fill_in "Attendee", with: @attandance.attendee_id
    fill_in "Users", with: @attandance.users
    click_on "Update Attandance"

    assert_text "Attandance was successfully updated"
    click_on "Back"
  end

  test "destroying a Attandance" do
    visit attandances_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Attandance was successfully destroyed"
  end
end
