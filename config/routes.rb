Rails.application.routes.draw do
  get '/:short_url', to: 'short_urls#show'
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :urls, only: %i[create index]
    end
  end
end
