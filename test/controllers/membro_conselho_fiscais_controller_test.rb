require 'test_helper'

class MembroConselhoFiscaisControllerTest < ActionController::TestCase
  setup do
    @membro_conselho_fiscal = membro_conselho_fiscais(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:membro_conselho_fiscais)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create membro_conselho_fiscal" do
    assert_difference('MembroConselhoFiscal.count') do
      post :create, membro_conselho_fiscal: { aluno_id: @membro_conselho_fiscal.aluno_id, cargo_membro_conselho_fiscal_id: @membro_conselho_fiscal.cargo_membro_conselho_fiscal_id }
    end

    assert_redirected_to membro_conselho_fiscal_path(assigns(:membro_conselho_fiscal))
  end

  test "should show membro_conselho_fiscal" do
    get :show, id: @membro_conselho_fiscal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @membro_conselho_fiscal
    assert_response :success
  end

  test "should update membro_conselho_fiscal" do
    patch :update, id: @membro_conselho_fiscal, membro_conselho_fiscal: { aluno_id: @membro_conselho_fiscal.aluno_id, cargo_membro_conselho_fiscal_id: @membro_conselho_fiscal.cargo_membro_conselho_fiscal_id }
    assert_redirected_to membro_conselho_fiscal_path(assigns(:membro_conselho_fiscal))
  end

  test "should destroy membro_conselho_fiscal" do
    assert_difference('MembroConselhoFiscal.count', -1) do
      delete :destroy, id: @membro_conselho_fiscal
    end

    assert_redirected_to membro_conselho_fiscais_path
  end
end
