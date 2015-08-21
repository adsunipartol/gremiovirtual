require 'test_helper'

class ConselhoFiscaisControllerTest < ActionController::TestCase
  setup do
    @conselho_fiscal = conselho_fiscais(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conselho_fiscais)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create conselho_fiscal" do
    assert_difference('ConselhoFiscal.count') do
      post :create, conselho_fiscal: { gremio_id: @conselho_fiscal.gremio_id }
    end

    assert_redirected_to conselho_fiscal_path(assigns(:conselho_fiscal))
  end

  test "should show conselho_fiscal" do
    get :show, id: @conselho_fiscal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @conselho_fiscal
    assert_response :success
  end

  test "should update conselho_fiscal" do
    patch :update, id: @conselho_fiscal, conselho_fiscal: { gremio_id: @conselho_fiscal.gremio_id }
    assert_redirected_to conselho_fiscal_path(assigns(:conselho_fiscal))
  end

  test "should destroy conselho_fiscal" do
    assert_difference('ConselhoFiscal.count', -1) do
      delete :destroy, id: @conselho_fiscal
    end

    assert_redirected_to conselho_fiscais_path
  end
end
