# encoding: utf-8

class UsuarioMailer < ActionMailer::Base
  #default from: '"Grêmio Virtual" <gremio.virtual@gmail.com>'
  
  
  def bem_vindo(usuario)
    @usuario = usuario
    mail(:to => [usuario.email], :subject => "Bem-vindo ao Grêmio Virtual!")
  end
  
end
