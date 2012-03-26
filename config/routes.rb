Quipu::Application.routes.draw do
  
  match "tasks/all", :to => "tasks#all", :as => :all_tasks
  match "tasks/overdue", :to => "tasks#overdue", :as => :overdue_tasks
  match "tasks/complete", :to => "tasks#complete", :as => :completed_tasks
  match "tasks/incomplete", :to => "tasks#incomplete", :as => :incomplete_tasks
  match "tasks/update", :to => "tasks#update_collection", :as => :update_tasks
  resources :tasks

  root :to => 'tasks#incomplete'
end
