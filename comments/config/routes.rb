Comments::Application.routes.draw do
  resources :authentications

  devise_for :users, :controller => {:registrations => 'registrations'}, :path_names => { :sign_up => "register" }

  resources :users

  resources :microposts

  resources :comments

  #match '/auth/:provider/callback' => 'authentications#create'

  match '/auth/:provider/callback', :to => 'authentications#create'
  match '/auth/failure', :to => 'authentications#failure'
  #get 'comments/filter'

 # match 'comments/filter' => 'comments#filter'
  post "filter"=> "comments#filter", :as=> "filter"
  match "mypage" => "comments#myPage", :as => "mypage"

  post "mypagefilter"=> "comments#myPageFilter", :as=> "mypagefilter"
  get "hide/:id"=> "comments#hide"
  get "unhide/:id" => "comments#unhide"
  get "reporting/:id" => "comments#reporting"
  get "unreporting/:id" => "comments#unreporting"
get "translate/:id" => "comments#translate"
  get "untranslate/:id" => "comments#untranslate"
  #match '/hide/:id', :to => 'comments#hide'

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
  root :to => 'comments#index'



  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
