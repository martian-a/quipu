class TasksController < ApplicationController
  
  # GET /tasks
  # GET /tasks.json
  def index
    redirect_to :controller => 'tasks', :action => 'incomplete'
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PUT /tasks/update
  # PUT /tasks/update.json
  def update_collection
       
    Task.destroy(params[:delete_task_ids])
    Task.batch_status_update(params[:batch_ids], params[:completed_task_ids])
    flash[:notice] = "Update complete."
      
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end    
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end
  
  # GET /all
  # GET /all.json
  def all
    @tasks = Task.all.sort_by(&:created_at)

    respond_to do |format|
      format.html # all.html.erb
      format.json { render json: @tasks }
    end
  end
  
  # GET /complete
  # GET /complete.json
  def complete
    @tasks = Task.complete.sort_by(&:deadline).reverse
    
    respond_to do |format|
      format.html # complete.html.erb
      format.json { render json: @tasks }    
    end
  end
  
  # GET /incomplete
  # GET /incomplete.json
  def incomplete
    @tasks = Task.incomplete.sort_by(&:deadline)
    
    respond_to do |format|
      format.html # incomplete.html.erb
      format.json { render json: @tasks }    
    end
  end
  
  # GET /overdue
  # GET /overdue.json
  def overdue
    @tasks = Task.overdue.sort_by(&:deadline)
    
    respond_to do |format|
      format.html # overdue.html.erb
      format.json { render json: @tasks }    
    end
  end
end
