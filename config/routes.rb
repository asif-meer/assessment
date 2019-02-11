Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get '/api' => redirect('/swagger/dist/index.html?url=/apidocs/api-docs.json')

  namespace 'api' do

    resources :todos

  end



end
