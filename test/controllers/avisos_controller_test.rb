require 'test_helper'

class AvisosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @aviso = avisos(:one)
  end

  test "should get index" do
    get avisos_url
    assert_response :success
  end

  test "should get new" do
    get new_aviso_url
    assert_response :success
  end

  test "should create aviso" do
    assert_difference('Aviso.count') do
      post avisos_url, params: { aviso: {  } }
    end

    assert_redirected_to aviso_url(Aviso.last)
  end

  test "should show aviso" do
    get aviso_url(@aviso)
    assert_response :success
  end

  test "should get edit" do
    get edit_aviso_url(@aviso)
    assert_response :success
  end

  test "should update aviso" do
    patch aviso_url(@aviso), params: { aviso: {  } }
    assert_redirected_to aviso_url(@aviso)
  end

  test "should destroy aviso" do
    assert_difference('Aviso.count', -1) do
      delete aviso_url(@aviso)
    end

    assert_redirected_to avisos_url
  end
end
