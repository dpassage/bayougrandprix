Bayougrandprix::Application.routes.draw do

  match 'login' => 'sessions#create', :via => [:get, :post], :as => :login
  get "logout" => "sessions#destroy", :as => :logout

# index, new, create, show, edit, update, destroy
  resources :teams

  resources :drivers

  resources :players

  resources :seasons do
    resources :races, :only => [ :create, :show, :update, :edit ] do
      resources :race_entries, :only => [ :create ]
    end
    resources :driver_entries, :only => [ :create, :destroy, :edit, :update ]
    get 'results', :on => :member
  end

  resources :scoring_schemes, :only => [ :index, :new, :create, :destroy ]
  
  root :to => "home#index"

end
