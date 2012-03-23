Quipu::Application.routes.draw do
  
  match "tasks/overdue", :to => "tasks#overdue", :as => :overdue_tasks
  match "tasks/complete", :to => "tasks#complete", :as => :completed_tasks
  resources :tasks

  root :to => 'tasks#index'
end
