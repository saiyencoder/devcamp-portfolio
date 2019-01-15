Rails.application.routes.draw do

  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'

  resources :blogs
  resources :portfolios
  
end
