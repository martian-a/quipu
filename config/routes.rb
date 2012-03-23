Quipu::Application.routes.draw do
  
  match "tasks/overdue", :to => "tasks#overdue", :as => :overdue_tasks
  resources :tasks

  root :to => 'tasks#index'
end
