require 'test_helper'

class EleicaoGremiosControllerTest < ActionController::TestCase
  setup do
    @eleicao_gremio = eleicao_gremios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:eleicao_gremios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create eleicao_gremio" do
    assert_difference('EleicaoGremio.count') do
      post :create, eleicao_gremio: {  }
    end

    assert_redirected_to eleicao_gremio_path(assigns(:eleicao_gremio))
  end

  test "should show eleicao_gremio" do
    get :show, id: @eleicao_gremio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @eleicao_gremio
    assert_response :success
  end

  test "should update eleicao_gremio" do
    patch :update, id: @eleicao_gremio, eleicao_gremio: {  }
    assert_redirected_to eleicao_gremio_path(assigns(:eleicao_gremio))
  end

  test "should destroy eleicao_gremio" do
    assert_difference('EleicaoGremio.count', -1) do
      delete :destroy, id: @eleicao_gremio
    end

    assert_redirected_to eleicao_gremios_path
  end
end
