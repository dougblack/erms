Erms::Application.routes.draw do
    
    root :to => 'home#index'
    get "log_in" => "sessions#new", :as => "log_in"
    get "log_out" => "sessions#destroy", :as => "log_out"
    get "/resources/search" => "resources#search", :as => "search"
    get "/resources/status" => "resources#status", :as => "status"
    get "/resources/report" => "resources#report", :as => "report"
    match "/requests/deploy" => "requests#deploy", :as => "deploy"
    match "/requests/deploy_request" => "requests#deploy_request", :as => "deploy_request"
    match "/requests/make_request" => "requests#make_request", :as => "make_request"
    match "/requests/return" => "requests#return", :as => "return"
    match "/requests/reject" => "requests#reject", :as => "reject"
    match "/resources/search_results" => "resources#search_results", :as => "search_results"
    resources :sessions    
    resources :users

    resources :resources

    resources :requests

    resources :municipalities

    resources :incidents

    resources :governmentagencies

    resources :esfs

    resources :costperitems

    resources :companies

    resources :capabilities

    resources :addesfs

  # The priority is based upon order of creation:
  # first created -> highest priority.

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
