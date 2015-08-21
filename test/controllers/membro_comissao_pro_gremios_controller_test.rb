require 'test_helper'

class MembroComissaoProGremiosControllerTest < ActionController::TestCase
  setup do
    @membro_comissao_pro_gremio = membro_comissao_pro_gremios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:membro_comissao_pro_gremios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create membro_comissao_pro_gremio" do
    assert_difference('MembroComissaoProGremio.count') do
      post :create, membro_comissao_pro_gremio: { aluno_id: @membro_comissao_pro_gremio.aluno_id, comissao_pro_gremio_id: @membro_comissao_pro_gremio.comissao_pro_gremio_id }
    end

    assert_redirected_to membro_comissao_pro_gremio_path(assigns(:membro_comissao_pro_gremio))
  end

  test "should show membro_comissao_pro_gremio" do
    get :show, id: @membro_comissao_pro_gremio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @membro_comissao_pro_gremio
    assert_response :success
  end

  test "should update membro_comissao_pro_gremio" do
    patch :update, id: @membro_comissao_pro_gremio, membro_comissao_pro_gremio: { aluno_id: @membro_comissao_pro_gremio.aluno_id, comissao_pro_gremio_id: @membro_comissao_pro_gremio.comissao_pro_gremio_id }
    assert_redirected_to membro_comissao_pro_gremio_path(assigns(:membro_comissao_pro_gremio))
  end

  test "should destroy membro_comissao_pro_gremio" do
    assert_difference('MembroComissaoProGremio.count', -1) do
      delete :destroy, id: @membro_comissao_pro_gremio
    end

    assert_redirected_to membro_comissao_pro_gremios_path
  end
end
