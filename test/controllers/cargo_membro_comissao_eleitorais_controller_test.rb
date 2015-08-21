require 'test_helper'

class CargoMembroComissaoEleitoraisControllerTest < ActionController::TestCase
  setup do
    @cargo_membro_comissao_eleitoral = cargo_membro_comissao_eleitorais(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cargo_membro_comissao_eleitorais)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cargo_membro_comissao_eleitoral" do
    assert_difference('CargoMembroComissaoEleitoral.count') do
      post :create, cargo_membro_comissao_eleitoral: { descricao: @cargo_membro_comissao_eleitoral.descricao }
    end

    assert_redirected_to cargo_membro_comissao_eleitoral_path(assigns(:cargo_membro_comissao_eleitoral))
  end

  test "should show cargo_membro_comissao_eleitoral" do
    get :show, id: @cargo_membro_comissao_eleitoral
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cargo_membro_comissao_eleitoral
    assert_response :success
  end

  test "should update cargo_membro_comissao_eleitoral" do
    patch :update, id: @cargo_membro_comissao_eleitoral, cargo_membro_comissao_eleitoral: { descricao: @cargo_membro_comissao_eleitoral.descricao }
    assert_redirected_to cargo_membro_comissao_eleitoral_path(assigns(:cargo_membro_comissao_eleitoral))
  end

  test "should destroy cargo_membro_comissao_eleitoral" do
    assert_difference('CargoMembroComissaoEleitoral.count', -1) do
      delete :destroy, id: @cargo_membro_comissao_eleitoral
    end

    assert_redirected_to cargo_membro_comissao_eleitorais_path
  end
end
