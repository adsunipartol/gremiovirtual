require 'test_helper'

class MembroComissaoEleitoraisControllerTest < ActionController::TestCase
  setup do
    @membro_comissao_eleitoral = membro_comissao_eleitorais(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:membro_comissao_eleitorais)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create membro_comissao_eleitoral" do
    assert_difference('MembroComissaoEleitoral.count') do
      post :create, membro_comissao_eleitoral: { aluno_id: @membro_comissao_eleitoral.aluno_id, comissao_eleitoral_id: @membro_comissao_eleitoral.comissao_eleitoral_id }
    end

    assert_redirected_to membro_comissao_eleitoral_path(assigns(:membro_comissao_eleitoral))
  end

  test "should show membro_comissao_eleitoral" do
    get :show, id: @membro_comissao_eleitoral
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @membro_comissao_eleitoral
    assert_response :success
  end

  test "should update membro_comissao_eleitoral" do
    patch :update, id: @membro_comissao_eleitoral, membro_comissao_eleitoral: { aluno_id: @membro_comissao_eleitoral.aluno_id, comissao_eleitoral_id: @membro_comissao_eleitoral.comissao_eleitoral_id }
    assert_redirected_to membro_comissao_eleitoral_path(assigns(:membro_comissao_eleitoral))
  end

  test "should destroy membro_comissao_eleitoral" do
    assert_difference('MembroComissaoEleitoral.count', -1) do
      delete :destroy, id: @membro_comissao_eleitoral
    end

    assert_redirected_to membro_comissao_eleitorais_path
  end
end
