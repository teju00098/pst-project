Rails.application.routes.draw do
  
  resources :variances do
    collection do
      post :import
      delete :cleardata
    end
  end
      
  resources :locations do
    collection do
      post :import
      delete :cleardata
      post :businessunit
    end
  end
  
  match '/business-form', to: 'home#business_form', via: [:get, :post]

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root to: 'home#home'
  resources :masters do
    collection do
      post :import
      delete :cleardata
      get :search
      get :prepare_import
    end  
  end
  
  namespace :api do
    resources :files, only: %i(index) do
      collection do
        get :download_db
        post :upload_csv
        get :verify_upload
      end
    end
  end

end
