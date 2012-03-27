Tip::Application.routes.draw do
  get "report/index"
  get "report/data"

  get "user_exam/exam_timeout"

  get "logout" => "user_sessions#destroy", :as => "logout"
  get "login" => "user_sessions#new", :as => "login"
  get "user_sessions/timeout"
  resources :user_sessions

  get "secret" => "home#secret", :as => "secret"
  get "finish" => "home#finish", :as => "finish"
  root :to => "home#index"
  get "test/index"
end
