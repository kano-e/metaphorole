# == Route Map
#
# Prefix Verb URI Pattern                        Controller#Action
#        GET  /auth/:provider/callback(.:format) user_sessions#create
#        POST /auth/:provider/callback(.:format) user_sessions#create
# logout GET  /logout(.:format)                  user_sessions#destroy
#

Rails.application.routes.draw do
  get 'auth/:provider/callback' => 'user_sessions#create'
  post 'auth/:provider/callback' => 'user_sessions#create'

  get 'logout' => 'user_sessions#destroy'
end
