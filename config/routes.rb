Rails.application.routes.draw do
  root to: "projects#index"
  get "new", to: "projects#new"
  post "projects", to: "projects#create"
  scope ":owner/:project" do
    get "", to: "projects#show"
    post "versions", to: "versions#create"
    get "versions/:id", to: "versions#show"
  end
end
