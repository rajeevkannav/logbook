Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#main' # shortcut for the above

  resources :home do
    collection do
      post 'upload'
    end
  end

end
