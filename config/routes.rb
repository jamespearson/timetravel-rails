Rails.application.routes.draw do

  resources :itineraries do
    resources :destinations
  end

  root to: "itineraries#index"
end
