# encoding: utf-8

class Usuarios::RegistrationsController < Devise::RegistrationsController

  layout "login", :only => [:new, :create]
  
  def create
    super
    
    usuario = Usuario.find_by_email(sign_up_params[:email])
    UsuarioMailer.bem_vindo(usuario).deliver
  end
  
  def edit
    if params[:reset_password_token]
      render :reset_password_token
    else
      super
    end
  end

  def update_resource(resource, params)
    if params[:password]
      resource.update_with_password(params)
    else
      resource.update_without_password(params)
    end
  end
  
  protected
  
    def after_update_path_for(resource)
      edit_usuario_registration_path
    end
  
    #def after_sign_up_path_for(resource) 
    #  new_usuario_session_path
    #end
  
  private 
    
    def sign_up_params
      params.require(:usuario).permit(:nome, :cpf, :email, :password, :password_confirmation)
    end
    
    def usuario_update_params
      params.require(:usuario).permit(:nome, :cpf, :email, :ativo, :password, :password_confirmation, :current_password)
    end
    
end
