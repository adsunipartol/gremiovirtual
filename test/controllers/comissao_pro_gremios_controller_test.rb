require 'test_helper'

class ComissaoProGremiosControllerTest < ActionController::TestCase
  setup do
    @comissao_pro_gremio = comissao_pro_gremios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comissao_pro_gremios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comissao_pro_gremio" do
    assert_difference('ComissaoProGremio.count') do
      post :create, comissao_pro_gremio: { ativa: @comissao_pro_gremio.ativa, colegio_id: @comissao_pro_gremio.colegio_id }
    end

    assert_redirected_to comissao_pro_gremio_path(assigns(:comissao_pro_gremio))
  end

  test "should show comissao_pro_gremio" do
    get :show, id: @comissao_pro_gremio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comissao_pro_gremio
    assert_response :success
  end

  test "should update comissao_pro_gremio" do
    patch :update, id: @comissao_pro_gremio, comissao_pro_gremio: { ativa: @comissao_pro_gremio.ativa, colegio_id: @comissao_pro_gremio.colegio_id }
    assert_redirected_to comissao_pro_gremio_path(assigns(:comissao_pro_gremio))
  end

  test "should destroy comissao_pro_gremio" do
    assert_difference('ComissaoProGremio.count', -1) do
      delete :destroy, id: @comissao_pro_gremio
    end

    assert_redirected_to comissao_pro_gremios_path
  end
end
