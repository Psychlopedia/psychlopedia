Psychlopedia::Application.routes.draw do
  resources :experiences, path: 'experiencias'
  get 'about', to: 'experiences#about', path: 'kestapasando'
  get 'random', to: 'experiences#random'
  root to: 'experiences#random'
end
