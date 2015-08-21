require 'test_helper'

class RepresentanteDeTurmasControllerTest < ActionController::TestCase
  setup do
    @representante_de_turma = representante_de_turmas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:representante_de_turmas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create representante_de_turma" do
    assert_difference('RepresentanteDeTurma.count') do
      post :create, representante_de_turma: { aluno_id: @representante_de_turma.aluno_id, turma_id: @representante_de_turma.turma_id }
    end

    assert_redirected_to representante_de_turma_path(assigns(:representante_de_turma))
  end

  test "should show representante_de_turma" do
    get :show, id: @representante_de_turma
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @representante_de_turma
    assert_response :success
  end

  test "should update representante_de_turma" do
    patch :update, id: @representante_de_turma, representante_de_turma: { aluno_id: @representante_de_turma.aluno_id, turma_id: @representante_de_turma.turma_id }
    assert_redirected_to representante_de_turma_path(assigns(:representante_de_turma))
  end

  test "should destroy representante_de_turma" do
    assert_difference('RepresentanteDeTurma.count', -1) do
      delete :destroy, id: @representante_de_turma
    end

    assert_redirected_to representante_de_turmas_path
  end
end
