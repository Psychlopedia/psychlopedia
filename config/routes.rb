Psychlopedia::Application.routes.draw do
  # experiences
  scope(path_names: {new: 'nueva'}) do
    resources :experiences, path: 'experiencias'
  end

  get 'about', to: 'experiences#about', path: 'kestapasando'
  get 'style_guide', to: 'experiences#style_guide', path: 'estilo'
  get 'random', to: 'experiences#random'
  get 'search', to: 'experiences#search'

  root to: 'experiences#index'
end
