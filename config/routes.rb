Psychlopedia::Application.routes.draw do
  resources :experiences
  get 'random', to: 'experiences#random'
  root to: 'experiences#random'
end
