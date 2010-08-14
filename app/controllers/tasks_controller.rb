class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.xml
  def index
    @tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.xml
  def show
    @task = Task.find(params[:id])
    @project = @task.parent_project
    @company = @project.company

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.xml
  def new
    @company = Company.find(params[:company_id])
    @project = Project.find(params[:project_id])
    
    @is_subtask = (!params[:is_subtask].blank? && !params[:parent_task_id].blank?) ? true : false
    @parent_task_id = params[:parent_task_id] if @is_subtask
    
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.xml
  def create
    @company = Company.find(params[:company_id])
    @project = Project.find(params[:project_id])
    taskable = (params[:task][:is_subtask].blank? || params[:task][:parent_task_id].blank?) ? @project : Task.find(params[:task][:parent_task_id].to_i)

    @task = Task.new(params[:task].merge(:taskable => taskable))

    respond_to do |format|
      if @task.save
        format.html { redirect_to([@company, @project, @task], :notice => 'Task was successfully created.') }
        format.xml  { render :xml => [@company, @project, @task], :status => :created, :location => @task }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.xml
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to(@task, :notice => 'Task was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.xml
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to(tasks_url) }
      format.xml  { head :ok }
    end
  end
end
