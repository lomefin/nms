Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :posts, param: :uuid do
      member do
        put :publish
        put :unpublish
      end
    end
  end

  scope ':channel' do
    resources :posts, only: [:show, :index], param: :uuid
  end

end
