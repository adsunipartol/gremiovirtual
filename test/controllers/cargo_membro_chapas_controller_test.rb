require 'test_helper'

class CargoMembroChapasControllerTest < ActionController::TestCase
  setup do
    @cargo_membro_chapa = cargo_membro_chapas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cargo_membro_chapas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cargo_membro_chapa" do
    assert_difference('CargoMembroChapa.count') do
      post :create, cargo_membro_chapa: { descricao: @cargo_membro_chapa.descricao }
    end

    assert_redirected_to cargo_membro_chapa_path(assigns(:cargo_membro_chapa))
  end

  test "should show cargo_membro_chapa" do
    get :show, id: @cargo_membro_chapa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cargo_membro_chapa
    assert_response :success
  end

  test "should update cargo_membro_chapa" do
    patch :update, id: @cargo_membro_chapa, cargo_membro_chapa: { descricao: @cargo_membro_chapa.descricao }
    assert_redirected_to cargo_membro_chapa_path(assigns(:cargo_membro_chapa))
  end

  test "should destroy cargo_membro_chapa" do
    assert_difference('CargoMembroChapa.count', -1) do
      delete :destroy, id: @cargo_membro_chapa
    end

    assert_redirected_to cargo_membro_chapas_path
  end
end
