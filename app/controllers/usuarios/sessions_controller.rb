# encoding: utf-8

class Usuarios::SessionsController < Devise::SessionsController

  layout "login"
  
  def create
    super
    
    session[:current_colegio_id] = params[:usuario][:colegio_id]
  end
  
end
