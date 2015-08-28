Rails.application.routes.draw do
  post '/graphql' => 'queries#create'
end
