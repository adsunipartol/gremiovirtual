require 'test_helper'

class ChapasControllerTest < ActionController::TestCase
  setup do
    @chapa = chapas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chapas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chapa" do
    assert_difference('Chapa.count') do
      post :create, chapa: { nome: @chapa.nome }
    end

    assert_redirected_to chapa_path(assigns(:chapa))
  end

  test "should show chapa" do
    get :show, id: @chapa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chapa
    assert_response :success
  end

  test "should update chapa" do
    patch :update, id: @chapa, chapa: { nome: @chapa.nome }
    assert_redirected_to chapa_path(assigns(:chapa))
  end

  test "should destroy chapa" do
    assert_difference('Chapa.count', -1) do
      delete :destroy, id: @chapa
    end

    assert_redirected_to chapas_path
  end
end
