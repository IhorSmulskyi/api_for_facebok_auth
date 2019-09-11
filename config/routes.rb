Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespase :api, defaults: {format: :json} do
    namespase :v1 do
      post "sign_up", to: "registrations#create"
end
