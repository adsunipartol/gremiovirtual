require 'test_helper'

class EleicaosControllerTest < ActionController::TestCase
  setup do
    @eleicao = eleicaos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:eleicaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create eleicao" do
    assert_difference('Eleicao.count') do
      post :create, eleicao: {  }
    end

    assert_redirected_to eleicao_path(assigns(:eleicao))
  end

  test "should show eleicao" do
    get :show, id: @eleicao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @eleicao
    assert_response :success
  end

  test "should update eleicao" do
    patch :update, id: @eleicao, eleicao: {  }
    assert_redirected_to eleicao_path(assigns(:eleicao))
  end

  test "should destroy eleicao" do
    assert_difference('Eleicao.count', -1) do
      delete :destroy, id: @eleicao
    end

    assert_redirected_to eleicaos_path
  end
end
