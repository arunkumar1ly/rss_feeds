require 'test_helper'

class FeedEntriesControllerTest < ActionController::TestCase
  setup do
    @feed_entry = feed_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:feed_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create feed_entry" do
    assert_difference('FeedEntry.count') do
      post :create, feed_entry: { app_key_id: @feed_entry.app_key_id, guid: @feed_entry.guid, is_star: @feed_entry.is_star, is_to_read: @feed_entry.is_to_read, last_clicked_on: @feed_entry.last_clicked_on, name: @feed_entry.name, published_at: @feed_entry.published_at, summary: @feed_entry.summary, url: @feed_entry.url }
    end

    assert_redirected_to feed_entry_path(assigns(:feed_entry))
  end

  test "should show feed_entry" do
    get :show, id: @feed_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @feed_entry
    assert_response :success
  end

  test "should update feed_entry" do
    put :update, id: @feed_entry, feed_entry: { app_key_id: @feed_entry.app_key_id, guid: @feed_entry.guid, is_star: @feed_entry.is_star, is_to_read: @feed_entry.is_to_read, last_clicked_on: @feed_entry.last_clicked_on, name: @feed_entry.name, published_at: @feed_entry.published_at, summary: @feed_entry.summary, url: @feed_entry.url }
    assert_redirected_to feed_entry_path(assigns(:feed_entry))
  end

  test "should destroy feed_entry" do
    assert_difference('FeedEntry.count', -1) do
      delete :destroy, id: @feed_entry
    end

    assert_redirected_to feed_entries_path
  end
end
