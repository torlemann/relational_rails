Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/creameries', to: 'creameries#index'
  get '/creameries/new', to: 'creameries#new'
  post '/creameries', to: 'creameries#create'
  get '/creameries/:id', to: 'creameries#show'
  get '/creameries/:id/edit', to: 'creameries#edit'
  patch '/creameries/:id', to: 'creameries#update'
  delete '/creameries/:id', to: 'creameries#destroy'
  
  get '/cheeses', to: 'cheeses#index'
  get '/cheeses/:id', to: 'cheeses#show'
end
