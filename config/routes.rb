Rails.application.routes.draw do
  
  get 'homes/index'
  get 'frees/search' => 'frees#search'
  get 'fcomments/create'

  get 'fcomments/destroy'
  
  get '/find_room' => 'room#find_room' 

  devise_for :users
  resources :conversations, only: [:create] do
   member do
    post :close
   end
  resources :messages, only: [:create]
  end
  
  root 'home#index'
  
  get 'enrollprofiles/index' => 'enrollprofiles#index'
  post 'enrollprofiles/create' => 'enrollprofiles#create'
 
  get 'enrollprofiles/show' => 'enrollprofiles#show'
  post 'enrollprofiles/update' => 'enrollprofiles#update'
  
  get 'home/index'
  get 'home/mypage' => 'home#mypage'
  get 'home/intro' => 'home#intro'
  get '/room/seoul' =>'room#seoul'
  get '/room/jeolla' =>'room#jeolla'
  get '/room/gyeongsang' =>'room#gyeongsang'
  get '/room/jeju' =>'room#jeju'
  get '/room/chungcheong' =>'room#chungcheong'
  get '/room/gangwon' =>'room#gangwon'
  get '/room/gyeonggi' =>'room#gyeonggi'
  get '/room/siteview' => 'room#siteview'
  get '/search_profile' =>'people#search_profile'
  
  get 'people/base' => 'people#base'
  get 'people/drum' => 'people#drum'
  get 'people/guitar' => 'people#guitar'
  get 'people/keyboard' => 'people#keyboard'
  get 'people/etc' => 'people#etc'
  get 'people/vocal' => 'people#vocal'
  get '/homes/index'
  get '/conversations/_conversation' => 'conversations#_conversation'
  get 'messages/_message'=>'messages#_message'
  
  get 'people/email_form' =>'people#email_form'
  get 'people/email_send' =>'people#email_send'
  post 'email/send' =>'email#send'

 

  resources :works do
    collection do
      get :search
    end
  end
  
  get 'works/search' => 'works#search'
  post '/wcomments' => 'wcomments#create'
  delete '/wcomments/:id' => 'wcomments#destroy'
  post 'work/:work_id/wlike' => 'works#wlike_toggle'
  
  resources :frees do
    resources :fcomments, only: [:create, :destroy]
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


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
