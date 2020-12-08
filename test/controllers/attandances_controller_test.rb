require 'test_helper'

class AttandancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attandance = attandances(:one)
  end

  test "should get index" do
    get attandances_url
    assert_response :success
  end

  test "should get new" do
    get new_attandance_url
    assert_response :success
  end

  test "should create attandance" do
    assert_difference('Attandance.count') do
      post attandances_url, params: { attandance: { attended_event_id: @attandance.attended_event_id, attendee_id: @attandance.attendee_id, users: @attandance.users } }
    end

    assert_redirected_to attandance_url(Attandance.last)
  end

  test "should show attandance" do
    get attandance_url(@attandance)
    assert_response :success
  end

  test "should get edit" do
    get edit_attandance_url(@attandance)
    assert_response :success
  end

  test "should update attandance" do
    patch attandance_url(@attandance), params: { attandance: { attended_event_id: @attandance.attended_event_id, attendee_id: @attandance.attendee_id, users: @attandance.users } }
    assert_redirected_to attandance_url(@attandance)
  end

  test "should destroy attandance" do
    assert_difference('Attandance.count', -1) do
      delete attandance_url(@attandance)
    end

    assert_redirected_to attandances_url
  end
end
