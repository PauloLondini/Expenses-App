Rails.application.routes.draw do
  get "/expenses", to: "expenses#index"

  post "/expenses", to: "expenses#create"

  get "/expenses/:id/edit", to: "expenses#edit"

  post "/expenses/:id", to: "expenses#update"

  post "/expenses/:id/delete", to: "expenses#destroy"
end
