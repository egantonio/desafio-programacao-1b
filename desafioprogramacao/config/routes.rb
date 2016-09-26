Rails.application.routes.draw do
  resources :uploads
  resources :dados
  root "dados#index"
  match '/uploadfile', to: 'dados#upload', via: 'post'
  get "dados" => "dados#index"
end
