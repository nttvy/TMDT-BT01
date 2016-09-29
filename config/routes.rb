Rails.application.routes.draw do
  resources :blogs do
    resources :comments, only: [:create]
  end

  get 'blogs/search/title', to: 'blogs#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
