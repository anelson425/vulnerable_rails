Rails.application.routes.draw do
  get '/injectable_users', to: 'users#injectable'
  get '/not_injectable_users', to: 'users#not_injectable'
end
