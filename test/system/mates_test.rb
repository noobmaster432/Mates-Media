require "application_system_test_case"

class MatesTest < ApplicationSystemTestCase
  setup do
    @mate = mates(:one)
  end

  test "visiting the index" do
    visit mates_url
    assert_selector "h1", text: "Mates"
  end

  test "should create mate" do
    visit mates_url
    click_on "New mate"

    fill_in "Email", with: @mate.email
    fill_in "First name", with: @mate.first_name
    fill_in "Last name", with: @mate.last_name
    fill_in "Phone", with: @mate.phone
    fill_in "Twitter", with: @mate.twitter
    click_on "Create Mate"

    assert_text "Mate was successfully created"
    click_on "Back"
  end

  test "should update Mate" do
    visit mate_url(@mate)
    click_on "Edit this mate", match: :first

    fill_in "Email", with: @mate.email
    fill_in "First name", with: @mate.first_name
    fill_in "Last name", with: @mate.last_name
    fill_in "Phone", with: @mate.phone
    fill_in "Twitter", with: @mate.twitter
    click_on "Update Mate"

    assert_text "Mate was successfully updated"
    click_on "Back"
  end

  test "should destroy Mate" do
    visit mate_url(@mate)
    click_on "Destroy this mate", match: :first

    assert_text "Mate was successfully destroyed"
  end
end
