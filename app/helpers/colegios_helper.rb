module ColegiosHelper
  
  def current_colegio
    @current_colegio = Colegio.find_by_id(session[:current_colegio_id])
  end
  
end
