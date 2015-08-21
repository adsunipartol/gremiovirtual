require 'test_helper'

class CargoFuncionariosControllerTest < ActionController::TestCase
  setup do
    @cargo_funcionario = cargo_funcionarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cargo_funcionarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cargo_funcionario" do
    assert_difference('CargoFuncionario.count') do
      post :create, cargo_funcionario: { descricao: @cargo_funcionario.descricao }
    end

    assert_redirected_to cargo_funcionario_path(assigns(:cargo_funcionario))
  end

  test "should show cargo_funcionario" do
    get :show, id: @cargo_funcionario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cargo_funcionario
    assert_response :success
  end

  test "should update cargo_funcionario" do
    patch :update, id: @cargo_funcionario, cargo_funcionario: { descricao: @cargo_funcionario.descricao }
    assert_redirected_to cargo_funcionario_path(assigns(:cargo_funcionario))
  end

  test "should destroy cargo_funcionario" do
    assert_difference('CargoFuncionario.count', -1) do
      delete :destroy, id: @cargo_funcionario
    end

    assert_redirected_to cargo_funcionarios_path
  end
end
