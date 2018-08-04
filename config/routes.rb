Rails.application.routes.draw do

  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :lists do
      member do
        post '/assign_member/:user_id', to: 'lists#assign_member'
        post 'unassign_member/:user_id', to: 'lists#unassign_member'
      end
      resources :cards
    end
  end

  post 'signup', to: 'users#create'
  post 'auth/login', to: 'authentication#authenticate'

end
