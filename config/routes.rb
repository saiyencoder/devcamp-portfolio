Rails.application.routes.draw do
  # Instead of localhost/users/sign_up -> it will be localhost/register
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  root to: 'pages#home'

  get 'about',         to: 'pages#about'
  get 'contact',       to: 'pages#contact'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  resources :blogs do
    member do
      get :toggle_status
    end
  end
  resources :portfolios, except: [:show]

end
