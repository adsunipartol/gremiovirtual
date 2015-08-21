# encoding: utf-8

class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :permissao_negada
  
  include ColegiosHelper
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale
  
  before_filter :authenticate_usuario!
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  
  
  # Override default method Pundit.pundit_user
  def pundit_user
    current_usuario
  end
  
  
  protected  
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:nome, :cpf) }
      devise_parameter_sanitizer.for(:usuario_update) { |u| u.permit(:nome, :cpf) }
    end
    
    def refresh_page 
      redirect_to(request.referrer || root_path)
    end
    
    
  private
  
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    
    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end
   
    def permissao_negada
      flash[:warning] = "Não permitido!"
      redirect_to(request.referrer || root_path)
    end
end