require "application_system_test_case"

class LifeItemsTest < ApplicationSystemTestCase
  setup do
    @life_item = life_items(:one)
  end

  test "visiting the index" do
    visit life_items_url
    assert_selector "h1", text: "Life Items"
  end

  test "creating a Life item" do
    visit life_items_url
    click_on "New Life Item"

    fill_in "Date", with: @life_item.date
    fill_in "Title", with: @life_item.title
    click_on "Create Life item"

    assert_text "Life item was successfully created"
    click_on "Back"
  end

  test "updating a Life item" do
    visit life_items_url
    click_on "Edit", match: :first

    fill_in "Date", with: @life_item.date
    fill_in "Title", with: @life_item.title
    click_on "Update Life item"

    assert_text "Life item was successfully updated"
    click_on "Back"
  end

  test "destroying a Life item" do
    visit life_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Life item was successfully destroyed"
  end
end
