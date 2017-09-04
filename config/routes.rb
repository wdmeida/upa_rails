Rails.application.routes.draw do
  root 'upa/home#index'
  
  namespace :backoffice do
    get 'dashboard/index'
    resources :specializations, except: [:show, :destroy]
    resources :admins, except: [:show]
    resources :doctors, except: [:destroy]
    resources :secretaries, except: [:show]
  end

  namespace :upa do
    get 'home/index'
    resources :patients, only: [:index]
  end
  
  get 'backoffice', to: 'backoffice/dashboard#index' 
  
  # Devise
  devise_for :admins, :skip => [:registrations]
  devise_for :doctors, :skip => [:registrations]
  devise_for :secretaries, :skip => [:registrations]  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
