Psychlopedia::Application.routes.draw do
  scope(path_names: {new: 'nueva'}) do
    resources :experiences, path: 'experiencias'
  end

  get 'about', to: 'experiences#about', path: 'kestapasando'
  get 'random', to: 'experiences#random'

  root to: 'experiences#random'
end
