ActionController::Routing::Routes.draw do |map|
  map.resources :measurements

  map.resources :gifts

  map.resources :giftlists

  map.resources :users

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
	map.root :controller => "users",
					 :action => "home"	

 	map.connect "add_user",
					:action => "add_user",
					:controller => "users"
					
	map.connect "/users/add_user",
					:action => "add_user",
					:controller => "users"
	
	map.connect ":id/manage_giftlists",
							:controller => "users",
							:action => "manage_giftlists"

	map.connect ":id/:giftlist/rss.:format",
							:controller => "users",
							:action => "rss"
							

	map.connect "search_users",
							:controller => "users",
							:action => "search_users"
	
	map.connect "login/",
							:controller => "users",
							:action => "login"
	
	map.connect "logout",
							:controller => "users",
							:action => "logout"

	map.connect ":id/add_gift",
							:controller => "users",
							:action => "user_gift_entry"
	
	map.connect ":id/giftlist_hide",
							:controller => "users",
							:action => "giftlist_hide"

	map.connect ":id/giftlist_unhide",
							:controller => "users",
							:action => "giftlist_unhide"

	map.connect ":id/",
							:controller 	=>	"users",
							:action				=>	"show_gifts"

	map.connect ":id/home",
							:controller => "users",
							:action => "admin"

	map.connect ":id/admin",
							:controller => "users",
							:action => "admin"
	
	map.connect ":id/add_new_gift",
							:controller => "users",
							:action => "add_new_gift"

	map.connect ":id/add_gift",
							:controller => "users",
							:action => "user_gift_entry"

	map.connect ":id/add_giftlist_dialog",
							:controller => "users",
							:action => "add_giftlist_dialog"

	map.connect ":id/add_gift_dialog",
							:controller => "users",
							:action => "add_gift_dialog"

	map.connect ":id/add_giftlist",
							:controller => "users",
							:action => "add_giftlist"

	map.connect ":id/cancel_new_giftlist",
							:controller => "users",
							:action => "cancel_new_giftlist"

	map.connect ":id/purchased_gift",
							:controller => "users",
							:action => "purchased_gift"

	map.connect ":id/delete_gift",
							:controller => "users",
							:action => "delete_gift"

	map.connect ":id/:giftlist",
							:controller => "users",
							:action => "show_giftlist"	

	map.connect ":id/:giftlist/:gift",
							:controller => "users",
							:action => "show_gift"

	map.connect ":id/:action",
							:controller 	=>	"users"

	map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
