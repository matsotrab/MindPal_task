require "test_helper"

class ClocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clock = clocks(:one)
  end

  test "should get index" do
    get clocks_url, as: :json
    assert_response :success
  end

  test "should create clock" do
    assert_difference("Clock.count") do
      post clocks_url, params: { clock: { category: @clock.category, desc: @clock.desc, name: @clock.name, photo_url: @clock.photo_url, price: @clock.price, user_id: @clock.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show clock" do
    get clock_url(@clock), as: :json
    assert_response :success
  end

  test "should update clock" do
    patch clock_url(@clock), params: { clock: { category: @clock.category, desc: @clock.desc, name: @clock.name, photo_url: @clock.photo_url, price: @clock.price, user_id: @clock.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy clock" do
    assert_difference("Clock.count", -1) do
      delete clock_url(@clock), as: :json
    end

    assert_response :no_content
  end
end
