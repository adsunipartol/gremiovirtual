require 'test_helper'

class GremiosControllerTest < ActionController::TestCase
  setup do
    @gremio = gremios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gremios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gremio" do
    assert_difference('Gremio.count') do
      post :create, gremio: { colegio_id: @gremio.colegio_id, nome: @gremio.nome }
    end

    assert_redirected_to gremio_path(assigns(:gremio))
  end

  test "should show gremio" do
    get :show, id: @gremio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gremio
    assert_response :success
  end

  test "should update gremio" do
    patch :update, id: @gremio, gremio: { colegio_id: @gremio.colegio_id, nome: @gremio.nome }
    assert_redirected_to gremio_path(assigns(:gremio))
  end

  test "should destroy gremio" do
    assert_difference('Gremio.count', -1) do
      delete :destroy, id: @gremio
    end

    assert_redirected_to gremios_path
  end
end
