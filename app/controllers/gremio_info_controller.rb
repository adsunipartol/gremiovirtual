# encoding: utf-8

class GremioInfoController < ApplicationController 
    
  def acoes
    render 'acoes'
  end
  
  def como_organizar
    render 'como_organizar'
  end
  
  def organize_na_sua_escola
    render 'organize_na_sua_escola'
  end
  
end