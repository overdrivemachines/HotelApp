# == Route Map
#
#                    Prefix Verb   URI Pattern                                              Controller#Action
#                    guests GET    /guests(.:format)                                        guests#index
#                           POST   /guests(.:format)                                        guests#create
#                 new_guest GET    /guests/new(.:format)                                    guests#new
#                edit_guest GET    /guests/:id/edit(.:format)                               guests#edit
#                     guest GET    /guests/:id(.:format)                                    guests#show
#                           PATCH  /guests/:id(.:format)                                    guests#update
#                           PUT    /guests/:id(.:format)                                    guests#update
#                           DELETE /guests/:id(.:format)                                    guests#destroy
#                     rooms GET    /rooms(.:format)                                         rooms#index
#                           POST   /rooms(.:format)                                         rooms#create
#                  new_room GET    /rooms/new(.:format)                                     rooms#new
#                 edit_room GET    /rooms/:id/edit(.:format)                                rooms#edit
#                      room GET    /rooms/:id(.:format)                                     rooms#show
#                           PATCH  /rooms/:id(.:format)                                     rooms#update
#                           PUT    /rooms/:id(.:format)                                     rooms#update
#                           DELETE /rooms/:id(.:format)                                     rooms#destroy
#                room_types GET    /room_types(.:format)                                    room_types#index
#                           POST   /room_types(.:format)                                    room_types#create
#             new_room_type GET    /room_types/new(.:format)                                room_types#new
#            edit_room_type GET    /room_types/:id/edit(.:format)                           room_types#edit
#                 room_type GET    /room_types/:id(.:format)                                room_types#show
#                           PATCH  /room_types/:id(.:format)                                room_types#update
#                           PUT    /room_types/:id(.:format)                                room_types#update
#                           DELETE /room_types/:id(.:format)                                room_types#destroy
#     property_reservations GET    /properties/:property_id/reservations(.:format)          reservations#index
#                           POST   /properties/:property_id/reservations(.:format)          reservations#create
#  new_property_reservation GET    /properties/:property_id/reservations/new(.:format)      reservations#new
# edit_property_reservation GET    /properties/:property_id/reservations/:id/edit(.:format) reservations#edit
#      property_reservation GET    /properties/:property_id/reservations/:id(.:format)      reservations#show
#                           PATCH  /properties/:property_id/reservations/:id(.:format)      reservations#update
#                           PUT    /properties/:property_id/reservations/:id(.:format)      reservations#update
#                           DELETE /properties/:property_id/reservations/:id(.:format)      reservations#destroy
#                properties GET    /properties(.:format)                                    properties#index
#                           POST   /properties(.:format)                                    properties#create
#              new_property GET    /properties/new(.:format)                                properties#new
#             edit_property GET    /properties/:id/edit(.:format)                           properties#edit
#                  property GET    /properties/:id(.:format)                                properties#show
#                           PATCH  /properties/:id(.:format)                                properties#update
#                           PUT    /properties/:id(.:format)                                properties#update
#                           DELETE /properties/:id(.:format)                                properties#destroy
#             welcome_index GET    /welcome/index(.:format)                                 welcome#index
#          new_user_session GET    /users/sign_in(.:format)                                 devise/sessions#new
#              user_session POST   /users/sign_in(.:format)                                 devise/sessions#create
#      destroy_user_session DELETE /users/sign_out(.:format)                                devise/sessions#destroy
#             user_password POST   /users/password(.:format)                                devise/passwords#create
#         new_user_password GET    /users/password/new(.:format)                            devise/passwords#new
#        edit_user_password GET    /users/password/edit(.:format)                           devise/passwords#edit
#                           PATCH  /users/password(.:format)                                devise/passwords#update
#                           PUT    /users/password(.:format)                                devise/passwords#update
#  cancel_user_registration GET    /users/cancel(.:format)                                  devise/registrations#cancel
#         user_registration POST   /users(.:format)                                         devise/registrations#create
#     new_user_registration GET    /users/sign_up(.:format)                                 devise/registrations#new
#    edit_user_registration GET    /users/edit(.:format)                                    devise/registrations#edit
#                           PATCH  /users(.:format)                                         devise/registrations#update
#                           PUT    /users(.:format)                                         devise/registrations#update
#                           DELETE /users(.:format)                                         devise/registrations#destroy
#                      root GET    /                                                        welcome#index
#

Rails.application.routes.draw do

  resources :guests
  
  resources :rooms
  resources :room_types
  resources :properties do
        resources :reservations
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get 'welcome/index'

  devise_for :users  

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
