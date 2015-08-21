GremioVirtual::Application.routes.draw do

  devise_for :usuarios,
          path: "",
          controllers: { 
                    sessions: "usuarios/sessions",
                    registrations: "usuarios/registrations",
                    passwords: "usuarios/passwords",
                    password_expired: "usuarios/password_expired"
                  },
                  path_names: { 
                    sign_in: 'entrar',
                    sign_out: 'sair',
                    password: 'senha', 
                    confirmation: 'confirmacao', 
                    unlock: 'desbloquear', 
                    registration: 'perfil', 
                    sign_up: 'sign_up',
                    password_expired: 'senha_expirou'
                }
  
  resources :colegios
  resources :funcionarios
  resources :turmas
  resources :alunos
  
  resources :representante_de_turmas
  
  resources :turmas do
    resources :alunos
    resources :representante_de_turmas, :as => 'representantes', :path => 'representantes'
  end
  
  resources :assembleia_gerais
  
  resources :gremios
  
  resources :chapas
  resources :membro_chapas
  resources :chapas do
    resources :membro_chapas, :as => 'membros'
    collection do
      get 'finalizar_cadastro', :path => '/:id/finalizar_cadastro'
      post 'votar',             :path => '/:id/votar'
    end
  end
  
  #resources :eleicao_gremios
  resources :eleicao_gremios do
    collection do
      get 'votacao', :path => '/:id/votacao'
    end
  end
  
  resources :cargo_representante_de_turmas
  resources :cargo_funcionarios
  resources :cargo_membro_comissao_eleitorais
  resources :cargo_membro_conselho_fiscais
  
  resources :conselho_fiscais
  resources :conselho_fiscais do
    resources :membro_conselho_fiscais, :as => 'membros', :path => 'membros'
    collection do
      get 'finalizar_cadastro',        :path => '/:id/finalizar_cadastro'
      get 'adicionar_membro_efetivo',  :path => '/:id/adicionar_membro_efetivo/:membro_id'
      get 'adicionar_membro_suplente', :path => '/:id/adicionar_membro_suplente/:membro_id'
    end
  end
  
  resources :conselho_representantes_de_turmas
  resources :conselho_representantes_de_turmas do
    resources :representante_de_turmas, :as => 'representantes', :path => 'representantes'
  end
  
  resources :membro_conselho_fiscais
  resources :comissao_eleitorais do
    resources :membro_comissao_eleitorais, :as => 'membros', :path => 'membros'
    resources :modelo_estatutos
  end
  
  resources :gremios do
    resources :socio_gremios, :as => 'socios', :path => 'socios'
    resources :comissao_eleitorais
    resources :assembleia_gerais
    resources :conselho_representantes_de_turmas
    resources :conselho_fiscais
  end
      
  resources :conselho_fiscais
  resources :conselho_fiscais, :as => :conselho_fiscal do
    resources :membro_conselho_fiscais, :as => 'membros', :path => 'membros'
    collection do
      get 'adicionar_membro_efetivo', :path => '/:conselho_fiscal_id/adicionar_membro_efetivo/:membro_id'
      get 'adicionar_membro_suplente', :path => '/:conselho_fiscal_id/adicionar_membro_suplente/:membro_id'
    end
  end
  
  resources :comissao_pro_gremios
  resources :comissao_pro_gremios do
    resources :membro_comissao_pro_gremios, :as => 'membros', :path => 'membros'
    collection do
      get 'finalizar_cadastro', :path => '/:id/finalizar_cadastro'
      get 'adicionar_membro', :path => '/:id/adicionar_membro/:aluno_id'
    end
  end
  resources :membro_comissao_pro_gremios
  
  
  resources :comissao_eleitorais
  resources :comissao_eleitorais do
    collection do
      get 'finalizar_cadastro', :path => '/:id/finalizar_cadastro'
      get 'adicionar_membro', :path => '/:id/adicionar_membro/:aluno_id'
    end
  end
  
  resources :membro_comissao_eleitorais
  
  
  # INFORMAÇÕES SOBRE O GRÊMIO ESTUDANTIL
  get 'gremio-estudantil-acoes' => 'gremio_info#acoes', :as => :gremio_estudantil_acoes
  get 'gremio-estudantil-organize-o-na-sua-escola' => 'gremio_info#organize_na_sua_escola', :as => :gremio_estudantil_organize_na_sua_escola
  get 'gremio-estudantil-como-organizar' => 'gremio_info#como_organizar', :as => :gremio_estudantil_como_organizar
  
  root 'gremio_info#acoes'

  
  
# The priority is based upon order of creation: first created -> highest priority.
# See how all your routes lay out with "rake routes".

# You can have the root of your site routed with "root"
# root 'welcome#index'

# Example of regular route:
#   get 'products/:id' => 'catalog#view'

# Example of named route that can be invoked with purchase_url(id: product.id)
#   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

# Example resource route (maps HTTP verbs to controller actions automatically):
#   resources :products

# Example resource route with options:
#   resources :products do
#     member do
#       get 'short'
#       post 'toggle'
#     end
#
#     collection do
#       get 'sold'
#     end
#   end

# Example resource route with sub-resources:
#   resources :products do
#     resources :comments, :sales
#     resource :seller
#   end

# Example resource route with more complex sub-resources:
#   resources :products do
#     resources :comments
#     resources :sales do
#       get 'recent', on: :collection
#     end
#   end

# Example resource route with concerns:
#   concern :toggleable do
#     post 'toggle'
#   end
#   resources :posts, concerns: :toggleable
#   resources :photos, concerns: :toggleable

# Example resource route within a namespace:
#   namespace :admin do
#     # Directs /admin/products/* to Admin::ProductsController
#     # (app/controllers/admin/products_controller.rb)
#     resources :products
#   end
end
