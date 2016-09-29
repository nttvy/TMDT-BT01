Rails.application.routes.draw do
  resources :blogs do
    resources :comments, only: [:create]
  end

  get 'search', to: 'blogs#search', as: :search
  get 'tags/:tag', to: 'blogs#show_blog_tagged', as: :tag
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
