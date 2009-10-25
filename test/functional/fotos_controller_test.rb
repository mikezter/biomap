require 'test_helper'

class FotosControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Foto.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Foto.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Foto.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to foto_url(assigns(:foto))
  end
  
  def test_edit
    get :edit, :id => Foto.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Foto.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Foto.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Foto.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Foto.first
    assert_redirected_to foto_url(assigns(:foto))
  end
  
  def test_destroy
    foto = Foto.first
    delete :destroy, :id => foto
    assert_redirected_to fotos_url
    assert !Foto.exists?(foto.id)
  end
end
