require "test_helper"

class NottesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @notte = nottes(:one)
  end

  test "should get index" do
    get nottes_url, as: :json
    assert_response :success
  end

  test "should create notte" do
    assert_difference('Notte.count') do
      post nottes_url, params: { notte: { body: @notte.body, title: @notte.title, user_id: @notte.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show notte" do
    get notte_url(@notte), as: :json
    assert_response :success
  end

  test "should update notte" do
    patch notte_url(@notte), params: { notte: { body: @notte.body, title: @notte.title, user_id: @notte.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy notte" do
    assert_difference('Notte.count', -1) do
      delete notte_url(@notte), as: :json
    end

    assert_response 204
  end
end
