Snicker::Application.routes.draw do
  root :to              => "feeds#index",             :as => :home
  resources :terms
end
