# encoding: utf-8

class Usuarios::PasswordExpiredController < Devise::PasswordExpiredController

  layout "login"
  
end
