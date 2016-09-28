Rails.application.routes.draw do
  get 'blog/home', to: 'blog#home'
  get 'blog/post', to: 'blog#post'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
