Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope ':channel' do
    resources :posts, only: [:show, :index], param: :uuid
  end

  # namespace :admin do
  #   resources :posts, param: :uuid
  # end
end
