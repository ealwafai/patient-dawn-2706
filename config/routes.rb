Rails.application.routes.draw do
  resources :competitions, only: [:index, :show] do
    resources :competition_entries, only: [:new, :create]
  end
end
