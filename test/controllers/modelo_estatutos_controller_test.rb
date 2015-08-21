require 'test_helper'

class ModeloEstatutosControllerTest < ActionController::TestCase
  setup do
    @modelo_estatuto = modelo_estatutos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:modelo_estatutos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create modelo_estatuto" do
    assert_difference('ModeloEstatuto.count') do
      post :create, modelo_estatuto: { aprovado: @modelo_estatuto.aprovado, comissao_pro_gremio_id: @modelo_estatuto.comissao_pro_gremio_id, estatuto: @modelo_estatuto.estatuto }
    end

    assert_redirected_to modelo_estatuto_path(assigns(:modelo_estatuto))
  end

  test "should show modelo_estatuto" do
    get :show, id: @modelo_estatuto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @modelo_estatuto
    assert_response :success
  end

  test "should update modelo_estatuto" do
    patch :update, id: @modelo_estatuto, modelo_estatuto: { aprovado: @modelo_estatuto.aprovado, comissao_pro_gremio_id: @modelo_estatuto.comissao_pro_gremio_id, estatuto: @modelo_estatuto.estatuto }
    assert_redirected_to modelo_estatuto_path(assigns(:modelo_estatuto))
  end

  test "should destroy modelo_estatuto" do
    assert_difference('ModeloEstatuto.count', -1) do
      delete :destroy, id: @modelo_estatuto
    end

    assert_redirected_to modelo_estatutos_path
  end
end
