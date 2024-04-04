Rails.application.routes.draw do
  scope :api do
    resources :links
  end
end
