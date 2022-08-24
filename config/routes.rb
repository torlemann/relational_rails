Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/creameries', to: 'creameries#index'
  get '/creameries/new', to: 'creameries#new'
  post '/creameries', to: 'creameries#create'
end
