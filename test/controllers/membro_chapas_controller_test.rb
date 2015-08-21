require 'test_helper'

class MembroChapasControllerTest < ActionController::TestCase
  setup do
    @membro_chapa = membro_chapas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:membro_chapas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create membro_chapa" do
    assert_difference('MembroChapa.count') do
      post :create, membro_chapa: { aluno_id: @membro_chapa.aluno_id, chapa_id: @membro_chapa.chapa_id }
    end

    assert_redirected_to membro_chapa_path(assigns(:membro_chapa))
  end

  test "should show membro_chapa" do
    get :show, id: @membro_chapa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @membro_chapa
    assert_response :success
  end

  test "should update membro_chapa" do
    patch :update, id: @membro_chapa, membro_chapa: { aluno_id: @membro_chapa.aluno_id, chapa_id: @membro_chapa.chapa_id }
    assert_redirected_to membro_chapa_path(assigns(:membro_chapa))
  end

  test "should destroy membro_chapa" do
    assert_difference('MembroChapa.count', -1) do
      delete :destroy, id: @membro_chapa
    end

    assert_redirected_to membro_chapas_path
  end
end
