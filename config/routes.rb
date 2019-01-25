Rails.application.routes.draw do
  root to: 'pages#home'

  get 'about',         to: 'pages#about'
  get 'contact',       to: 'pages#contact'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  resources :blogs
  resources :portfolios, except: [:show]

end
