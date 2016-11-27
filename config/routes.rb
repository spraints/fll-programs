Rails.application.routes.draw do
  root to: "projects#index"
  get "new", to: "projects#new"
  post "projects", to: "projects#create"
  get ":owner/:project", to: "projects#show"
  post ":owner/:project/versions", to: "versions#create"
end
