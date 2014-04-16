Psychlopedia::Application.routes.draw do
  # guides
  get 'guides', to: 'guides#index', path: 'guias'
  get 'set_and_setting', to: 'guides#set_and_setting', path: 'guias/set_and_setting'
  get 'dxm_guide', to: 'guides#dxm', path: 'guias/dxm'
  get 'lsd_guide',  to: 'guides#lsd', path: 'guias/lsd'
  get 'mdma_guide', to: 'guides#mdma', path: 'guias/mdma'
  get 'nbomes_guide', to: 'guides#nbomes', path: 'guias/nbomes'

  # experiences
  scope(path_names: {new: 'nueva'}) do
    resources :experiences, path: 'experiencias'
  end

  get 'about', to: 'experiences#about', path: 'kestapasando'
  get 'random', to: 'experiences#random'
  get 'search', to: 'experiences#search'

  root to: 'experiences#index'
end
