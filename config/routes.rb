Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#home'
  get 'about', to: 'pages#about'

  resources :articles #ajoute toutes les routes utiles liées à la base de données des articles

end
