Namloos::Application.routes.draw do
  resources :seller_rates

  resources :call_definations

  resources :callgroups

  resources :prefixes

  resources :regions

  resources :apply_tos

  resources :countries

  resources :privileges
  resources :groups
  resources :site_users
  match 'site_users/assign_privileges/:id' => 'site_users#assign_privileges'
  match 'site_users/create' => 'site_users#create'
  match 'site_users/show/:id' => 'site_users#show'
  match 'site_users/edit/:id' => 'site_users#edit'
  match 'site_users/update/:id' => 'site_users#update'
  match 'site_users/user_privileges/:id' => 'site_users#user_privileges'
  match 'site_users/destroy/:id' => 'site_users#destroy'


  # The priority is based upon order of creation:
  # first created -> highest priority.

  devise_for :users, :controllers => {
    :sessions => "users/sessions",
    :confirmation => "users/confirmations",
    :passwords => "users/passwords",
    :registrations => "users/registrations",
    :unlocks => "users/unlocks",
    :omniauth => "users/omniauth_callbacks"
  }
  devise_scope :user do    
    root :to => "users/sessions#new"
    get "sign_in" => "users/sessions#new"
    get "sign_out" => "users/sessions#destroy"
    #    get "users" => "users/registrations#index"
    #    get "show_user/:id" => "users/registrations#show"
    #    get "new_user" => "users/registrations#new"
    #    get "edit_user/:id" => "users/registrations#edit"
    #    get "destroy_user/:id" => "users/registrations#destroy"
  end

  resources :home

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
