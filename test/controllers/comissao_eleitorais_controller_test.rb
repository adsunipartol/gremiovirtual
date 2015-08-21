require 'test_helper'

class ComissaoEleitoraisControllerTest < ActionController::TestCase
  setup do
    @comissao_eleitoral = comissao_eleitorais(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comissao_eleitorais)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comissao_eleitoral" do
    assert_difference('ComissaoEleitoral.count') do
      post :create, comissao_eleitoral: { gremio_id: @comissao_eleitoral.gremio_id }
    end

    assert_redirected_to comissao_eleitoral_path(assigns(:comissao_eleitoral))
  end

  test "should show comissao_eleitoral" do
    get :show, id: @comissao_eleitoral
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comissao_eleitoral
    assert_response :success
  end

  test "should update comissao_eleitoral" do
    patch :update, id: @comissao_eleitoral, comissao_eleitoral: { gremio_id: @comissao_eleitoral.gremio_id }
    assert_redirected_to comissao_eleitoral_path(assigns(:comissao_eleitoral))
  end

  test "should destroy comissao_eleitoral" do
    assert_difference('ComissaoEleitoral.count', -1) do
      delete :destroy, id: @comissao_eleitoral
    end

    assert_redirected_to comissao_eleitorais_path
  end
end
