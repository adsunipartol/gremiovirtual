require 'test_helper'

class AssembleiaGeraisControllerTest < ActionController::TestCase
  setup do
    @assembleia_geral = assembleia_gerais(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assembleia_gerais)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create assembleia_geral" do
    assert_difference('AssembleiaGeral.count') do
      post :create, assembleia_geral: { colegio_id: @assembleia_geral.colegio_id }
    end

    assert_redirected_to assembleia_geral_path(assigns(:assembleia_geral))
  end

  test "should show assembleia_geral" do
    get :show, id: @assembleia_geral
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @assembleia_geral
    assert_response :success
  end

  test "should update assembleia_geral" do
    patch :update, id: @assembleia_geral, assembleia_geral: { colegio_id: @assembleia_geral.colegio_id }
    assert_redirected_to assembleia_geral_path(assigns(:assembleia_geral))
  end

  test "should destroy assembleia_geral" do
    assert_difference('AssembleiaGeral.count', -1) do
      delete :destroy, id: @assembleia_geral
    end

    assert_redirected_to assembleia_gerais_path
  end
end
