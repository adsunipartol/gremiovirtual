require 'test_helper'

class ConselhoRepresentantesDeTurmasControllerTest < ActionController::TestCase
  setup do
    @conselho_representantes_de_turma = conselho_representantes_de_turmas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conselho_representantes_de_turmas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create conselho_representantes_de_turma" do
    assert_difference('ConselhoRepresentantesDeTurma.count') do
      post :create, conselho_representantes_de_turma: { gremio_id: @conselho_representantes_de_turma.gremio_id }
    end

    assert_redirected_to conselho_representantes_de_turma_path(assigns(:conselho_representantes_de_turma))
  end

  test "should show conselho_representantes_de_turma" do
    get :show, id: @conselho_representantes_de_turma
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @conselho_representantes_de_turma
    assert_response :success
  end

  test "should update conselho_representantes_de_turma" do
    patch :update, id: @conselho_representantes_de_turma, conselho_representantes_de_turma: { gremio_id: @conselho_representantes_de_turma.gremio_id }
    assert_redirected_to conselho_representantes_de_turma_path(assigns(:conselho_representantes_de_turma))
  end

  test "should destroy conselho_representantes_de_turma" do
    assert_difference('ConselhoRepresentantesDeTurma.count', -1) do
      delete :destroy, id: @conselho_representantes_de_turma
    end

    assert_redirected_to conselho_representantes_de_turmas_path
  end
end
