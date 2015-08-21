require 'test_helper'

class CargoMembroConselhoFiscaisControllerTest < ActionController::TestCase
  setup do
    @cargo_membro_conselho_fiscal = cargo_membro_conselho_fiscais(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cargo_membro_conselho_fiscais)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cargo_membro_conselho_fiscal" do
    assert_difference('CargoMembroConselhoFiscal.count') do
      post :create, cargo_membro_conselho_fiscal: { descricao: @cargo_membro_conselho_fiscal.descricao }
    end

    assert_redirected_to cargo_membro_conselho_fiscal_path(assigns(:cargo_membro_conselho_fiscal))
  end

  test "should show cargo_membro_conselho_fiscal" do
    get :show, id: @cargo_membro_conselho_fiscal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cargo_membro_conselho_fiscal
    assert_response :success
  end

  test "should update cargo_membro_conselho_fiscal" do
    patch :update, id: @cargo_membro_conselho_fiscal, cargo_membro_conselho_fiscal: { descricao: @cargo_membro_conselho_fiscal.descricao }
    assert_redirected_to cargo_membro_conselho_fiscal_path(assigns(:cargo_membro_conselho_fiscal))
  end

  test "should destroy cargo_membro_conselho_fiscal" do
    assert_difference('CargoMembroConselhoFiscal.count', -1) do
      delete :destroy, id: @cargo_membro_conselho_fiscal
    end

    assert_redirected_to cargo_membro_conselho_fiscais_path
  end
end
