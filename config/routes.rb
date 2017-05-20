Rails.application.routes.draw do

#Casein routes
namespace :casein do
    resources :inboxes
    resources :links
#    get ':slug' => 'casein/links#show'

end
    root 'casein/links#index'
    get '/casein' => 'casein/links#index'
    get ':slug' => 'redirect_url#index'
    get ':url' => 'casein/inboxes#new/:id'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
