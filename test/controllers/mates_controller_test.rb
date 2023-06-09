require "test_helper"

class MatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mate = mates(:one)
  end

  test "should get index" do
    get mates_url
    assert_response :success
  end

  test "should get new" do
    get new_mate_url
    assert_response :success
  end

  test "should create mate" do
    assert_difference("Mate.count") do
      post mates_url, params: { mate: { email: @mate.email, first_name: @mate.first_name, last_name: @mate.last_name, phone: @mate.phone, twitter: @mate.twitter } }
    end

    assert_redirected_to mate_url(Mate.last)
  end

  test "should show mate" do
    get mate_url(@mate)
    assert_response :success
  end

  test "should get edit" do
    get edit_mate_url(@mate)
    assert_response :success
  end

  test "should update mate" do
    patch mate_url(@mate), params: { mate: { email: @mate.email, first_name: @mate.first_name, last_name: @mate.last_name, phone: @mate.phone, twitter: @mate.twitter } }
    assert_redirected_to mate_url(@mate)
  end

  test "should destroy mate" do
    assert_difference("Mate.count", -1) do
      delete mate_url(@mate)
    end

    assert_redirected_to mates_url
  end
end
