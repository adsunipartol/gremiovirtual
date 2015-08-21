require 'test_helper'

class CargoRepresentanteDeTurmasControllerTest < ActionController::TestCase
  setup do
    @cargo_representante_de_turma = cargo_representante_de_turmas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cargo_representante_de_turmas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cargo_representante_de_turma" do
    assert_difference('CargoRepresentanteDeTurma.count') do
      post :create, cargo_representante_de_turma: { descricao: @cargo_representante_de_turma.descricao }
    end

    assert_redirected_to cargo_representante_de_turma_path(assigns(:cargo_representante_de_turma))
  end

  test "should show cargo_representante_de_turma" do
    get :show, id: @cargo_representante_de_turma
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cargo_representante_de_turma
    assert_response :success
  end

  test "should update cargo_representante_de_turma" do
    patch :update, id: @cargo_representante_de_turma, cargo_representante_de_turma: { descricao: @cargo_representante_de_turma.descricao }
    assert_redirected_to cargo_representante_de_turma_path(assigns(:cargo_representante_de_turma))
  end

  test "should destroy cargo_representante_de_turma" do
    assert_difference('CargoRepresentanteDeTurma.count', -1) do
      delete :destroy, id: @cargo_representante_de_turma
    end

    assert_redirected_to cargo_representante_de_turmas_path
  end
end
