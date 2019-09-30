require 'test_helper'

class LifeItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @life_item = life_items(:one)
  end

  test "should get index" do
    get life_items_url
    assert_response :success
  end

  test "should get new" do
    get new_life_item_url
    assert_response :success
  end

  test "should create life_item" do
    assert_difference('LifeItem.count') do
      post life_items_url, params: { life_item: { date: @life_item.date, title: @life_item.title } }
    end

    assert_redirected_to life_item_url(LifeItem.last)
  end

  test "should show life_item" do
    get life_item_url(@life_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_life_item_url(@life_item)
    assert_response :success
  end

  test "should update life_item" do
    patch life_item_url(@life_item), params: { life_item: { date: @life_item.date, title: @life_item.title } }
    assert_redirected_to life_item_url(@life_item)
  end

  test "should destroy life_item" do
    assert_difference('LifeItem.count', -1) do
      delete life_item_url(@life_item)
    end

    assert_redirected_to life_items_url
  end
end
