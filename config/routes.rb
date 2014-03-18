Psychlopedia::Application.routes.draw do
  resources :experiences
  get 'random', to: 'experiences#random'
  get 'about', to: 'experiences#about'
  root to: 'experiences#random'
end
